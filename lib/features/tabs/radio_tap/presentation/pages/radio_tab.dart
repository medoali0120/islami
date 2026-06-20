import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/features/tabs/radio_tap/data/radio_remote_api_data_source.dart';
import 'package:islami/features/tabs/radio_tap/data/repo/radio_repo_imp.dart';
import 'package:islami/features/tabs/radio_tap/domain/usecaase/get_radio_usecase.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/radio_cubit.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/radio_state.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/custom_tapbar.dart';
import 'package:islami/features/tabs/radio_tap/presentation/widget/radio_card_widget.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final repo = RadioRepoImp(radioRemoteDataSource: RadioRemoteApiDataSource());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RadioCubit(getRadioUsecase: GetRadioUsecase(radioRepo: repo))
            ..getRadio(),
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
                    child: BlocBuilder<RadioCubit, RadiosState>(
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
                          return TabBarView(
                            children: [
                              ListView.separated(
                                itemBuilder: (context, index) =>
                                    RadioCardWidget(
                                      name: state.radios[index].name,
                                      url: state.radios[index].url,
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: state.radios.length,
                              ),

                              ListView.separated(
                                itemBuilder: (context, index) =>
                                    RadioCardWidget(),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: 10,
                              ),
                            ],
                          );
                        }
                        return SizedBox.shrink();
                      },
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
