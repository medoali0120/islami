import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/features/tabs/radio_tap/data/data_source/radio_remote_api_data_source.dart';
import 'package:islami/features/tabs/radio_tap/data/model/sura_reciters_model.dart';
import 'package:islami/features/tabs/radio_tap/data/repo/radio_repo_imp.dart';
import 'package:islami/features/tabs/radio_tap/domain/usecaase/get_radio_usecase.dart';
import 'package:islami/features/tabs/radio_tap/domain/usecaase/get_reciters_usercase.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/radio_cubit.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/radio_state.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/reciteers_state.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/reciters_cubit.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/bottom_sheet_button.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/custom_tapbar.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/radio_card_widget.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  QuranSurahModel selectedSurah = quranSurahs[0];
  final repo = RadioRepoImp(radioRemoteDataSource: RadioRemoteApiDataSource());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RadioCubit(getRadioUsecase: GetRadioUsecase(radioRepo: repo))
                ..getRadio(),
        ),
        BlocProvider(
          create: (context) => RecitersCubit(
            getRecitersUsecase: GetRecitersUsecase(recitersRepo: repo),
          )..getReciters(),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManger.radioBg)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.asset(AssetsManger.islamiLogo),
                  SizedBox(height: 7.h),
                  CustomTapbar(),
                  SizedBox(height: 10.h),

                  Expanded(
                    child: TabBarView(
                      children: [
                        BlocBuilder<RadioCubit, RadiosState>(
                          builder: (context, state) {
                            if (state is RadiosLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is RadiosError) {
                              return Center(child: Text(state.message));
                            }

                            if (state is RadiosSuccess) {
                              return ListView.separated(
                                itemCount: state.radios.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.h),
                                itemBuilder: (context, index) {
                                  return RadioCardWidget(
                                    name: state.radios[index].name,
                                    url: state.radios[index].url,
                                  );
                                },
                              );
                            }

                            return const SizedBox();
                          },
                        ),

                        BlocBuilder<RecitersCubit, RecitersState>(
                          builder: (context, state) {
                            print(state.runtimeType);
                            if (state is RecitersLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is RecitersError) {
                              return Center(child: Text(state.message));
                            }

                            if (state is RecitersSuccess) {
                              return Column(
                                children: [
                                  BottomSheetButton(
                                    onSurahSelected: (surah) {
                                      setState(() {
                                        selectedSurah = surah;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 12.h),
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: state.reciters.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.h),
                                      itemBuilder: (context, index) {
                                        return RadioCardWidget(
                                          name: state.reciters[index].name,
                                          url:
                                              "${state.reciters[index].moshaf[0].server}${selectedSurah.code}.mp3",
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
