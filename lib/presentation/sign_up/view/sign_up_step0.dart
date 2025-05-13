import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/checkbox/checkbox.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpStep0 extends ConsumerStatefulWidget {
  const SignUpStep0({super.key});

  @override
  ConsumerState<SignUpStep0> createState() => _SignUpStep5State();
}

class _SignUpStep5State extends ConsumerState<SignUpStep0> {
  /// 전체 동의
  bool _isAllAgreed = false;

  /// 이용약관 (필수)
  bool _isTermAgreed = false;

  /// 개인정보취급방침 (필수)
  bool _isPrivacyAgreed = false;

  /// 위치기반서비스 이용약관 (필수)
  bool _isLocationAgreed = false;

  /// 마케팅 활용 동의 (선택)
  bool _isMarketingAgreed = false;

  Future<void> _launchUrl({required String urlString}) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomLoadingOverlay(
      isLoading: false,
      child: CustomSignUpWrapper(
        title: '약관 동의',
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '서비스 이용을 위해\n이용약관 동의가 필요해요',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          '전체 동의',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 13 / 16,
                            color: ScaleColorConfig.neutral20,
                          ),
                        ),
                        CustomCheckBox(
                          onTap: () {
                            setState(() {
                              if (_isAllAgreed) {
                                _isAllAgreed = false;
                                _isTermAgreed = false;
                                _isPrivacyAgreed = false;
                                _isLocationAgreed = false;
                                _isMarketingAgreed = false;
                              } else {
                                _isAllAgreed = true;
                                _isTermAgreed = true;
                                _isPrivacyAgreed = true;
                                _isLocationAgreed = true;
                                _isMarketingAgreed = true;
                              }
                            });
                          },
                          value: _isAllAgreed,
                        ),
                      ],
                    ),

                    const Divider(color: ScaleColorConfig.neutral70),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                              urlString:
                                  'https://deadpan-swift-62c.notion.site/1b5c3a9f020181baadfff3d50d9ef94f',
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                '이용약관 동의 (필수)',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Assets.icon.arrow.rightLine.svg(
                                width: 20,
                                colorFilter: const ColorFilter.mode(
                                  ScaleColorConfig.neutral40,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomCheckBox(
                          onTap: () {
                            setState(() {
                              if (_isTermAgreed) {
                                _isAllAgreed = false;
                                _isTermAgreed = false;
                              } else {
                                _isTermAgreed = true;

                                /// 모든 항목이 체크된 경우
                                if (_isTermAgreed &&
                                    _isPrivacyAgreed &&
                                    _isLocationAgreed &&
                                    _isMarketingAgreed) {
                                  _isAllAgreed = true;
                                }
                              }
                            });
                          },
                          value: _isTermAgreed,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                              urlString:
                                  'https://docs.google.com/document/d/19idqC9uxRsP_akj5DMXOcQ6FHk_qUun8NnSYLgtOQ6s/edit?tab=t.0#heading=h.x0195amxm9oc',
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                '개인정보 수집 이용 동의 (필수)',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Assets.icon.arrow.rightLine.svg(
                                width: 20,
                                colorFilter: const ColorFilter.mode(
                                  ScaleColorConfig.neutral40,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomCheckBox(
                          onTap: () {
                            setState(() {
                              if (_isPrivacyAgreed) {
                                _isAllAgreed = false;
                                _isPrivacyAgreed = false;
                              } else {
                                _isPrivacyAgreed = true;

                                /// 모든 항목이 체크된 경우
                                if (_isTermAgreed &&
                                    _isPrivacyAgreed &&
                                    _isLocationAgreed &&
                                    _isMarketingAgreed) {
                                  _isAllAgreed = true;
                                }
                              }
                            });
                          },
                          value: _isPrivacyAgreed,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                              urlString:
                                  'https://deadpan-swift-62c.notion.site/1b5c3a9f0201815f874cf82efb5317ad',
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                '위치기반서비스 이용약관 동의 (필수)',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Assets.icon.arrow.rightLine.svg(
                                width: 20,
                                colorFilter: const ColorFilter.mode(
                                  ScaleColorConfig.neutral40,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomCheckBox(
                          onTap: () {
                            setState(() {
                              if (_isLocationAgreed) {
                                _isAllAgreed = false;
                                _isLocationAgreed = false;
                              } else {
                                _isLocationAgreed = true;

                                /// 모든 항목이 체크된 경우
                                if (_isTermAgreed &&
                                    _isPrivacyAgreed &&
                                    _isLocationAgreed &&
                                    _isMarketingAgreed) {
                                  _isAllAgreed = true;
                                }
                              }
                            });
                          },
                          value: _isLocationAgreed,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _launchUrl(
                              urlString:
                                  'https://deadpan-swift-62c.notion.site/DesserBee-1b5c3a9f0201819882f7c746ff83c5e2',
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                '마케팅 활용 동의 (선택)',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: ScaleColorConfig.neutral20,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Assets.icon.arrow.rightLine.svg(
                                width: 20,
                                colorFilter: const ColorFilter.mode(
                                  ScaleColorConfig.neutral40,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomCheckBox(
                          onTap: () {
                            setState(() {
                              if (_isMarketingAgreed) {
                                _isAllAgreed = false;
                                _isMarketingAgreed = false;
                              } else {
                                _isMarketingAgreed = true;

                                /// 모든 항목이 체크된 경우
                                if (_isTermAgreed &&
                                    _isPrivacyAgreed &&
                                    _isLocationAgreed &&
                                    _isMarketingAgreed) {
                                  _isAllAgreed = true;
                                }
                              }
                            });
                          },
                          value: _isMarketingAgreed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            CustomFillButton.large(
              label: '동의하고 다음',
              disabled:
                  !_isTermAgreed || !_isPrivacyAgreed || !_isLocationAgreed,
              onPressed: () {
                context.pushNamed(AppRoutes.signUpStep1.name);
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
          ],
        ),
      ),
    );
  }
}
