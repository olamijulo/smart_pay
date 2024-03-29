import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/data/countries_data.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/about/about_view_model.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/utilities/validator.dart';
import 'package:smart_pay/widgets/countries_tile.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class AboutView extends ConsumerWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Form(
              key: ref.watch(aboutViewModelProvider).aboutFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(
                    height: 40.0,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Hey there! tell us a bit \n ',
                          style: context.textTheme.headlineSmall,
                          children: [
                        TextSpan(
                            text: 'about ',
                            style: context.textTheme.headlineSmall),
                        TextSpan(
                            text: 'yourself\n',
                            style: context.textTheme.headlineSmall!
                                .copyWith(color: primaryColor)),
                      ])),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller:
                        ref.watch(aboutViewModelProvider).fullNameContoller,
                    validator: (value) => Validator.validateField(value),
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(hintText: 'Full Name'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller:
                        ref.watch(aboutViewModelProvider).emailContoller,
                    validator: (value) => Validator.validateEmail(value),
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller:
                        ref.watch(aboutViewModelProvider).userNameContoller,
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return CountriesBottomSheet();
                          });
                    },
                    child: TextFormField(
                      controller:
                          ref.watch(aboutViewModelProvider).countryContoller,
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          hintText: 'Select a country',
                          prefixIcon:
                              ref.watch(aboutViewModelProvider).countryFlag ==
                                      ''
                                  ? SizedBox.shrink()
                                  : Image.asset(
                                      ref
                                          .watch(aboutViewModelProvider)
                                          .countryFlag!,
                                      scale: 5,
                                    ),
                          suffixIcon: Image.asset(
                            AppAsset.arrowDown,
                            scale: 32.0,
                            color: grey500,
                          )),
                      enabled: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller:
                        ref.watch(aboutViewModelProvider).passwordContoller,
                    validator: (value) => Validator.validatePassword(value),
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    obscureText: ref.watch(aboutViewModelProvider).obcureText,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            ref
                                .read(aboutViewModelProvider.notifier)
                                .togglePassword();
                          },
                          child: Visibility(
                            visible:
                                ref.watch(aboutViewModelProvider).obcureText,
                            replacement: Image.asset(
                              AppAsset.view,
                              scale: 20,
                              color: grey500,
                            ),
                            child: Image.asset(
                              AppAsset.hide,
                              scale: 20,
                              color: grey500,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 56.0,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () => ref
                            .read(aboutViewModelProvider.notifier)
                            .signUp(context),
                        child: Text(
                          'Continue',
                          style: context.textTheme.bodyLarge!.copyWith(
                              color: white, fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

class CountriesBottomSheet extends ConsumerWidget {
  const CountriesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 700.0,
      padding: const EdgeInsets.all(40.0),
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Image.asset(AppAsset.searchIcon)),
              )),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: Text(
                  'Cancel',
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CountriesTile(
                    initials: countries[index]['initials'],
                    imageUrl: countries[index]['flag'],
                    title: countries[index]['name'],
                    selected:
                        ref.watch(aboutViewModelProvider).countryValues[index],
                    onTap: (initials, title, selected, imageUrl) {
                      ref.read(aboutViewModelProvider.notifier).toggleCountries(
                          index, selected, initials, title, imageUrl);
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                itemCount: countries.length),
          )
        ],
      ),
    );
  }
}
