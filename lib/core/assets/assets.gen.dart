/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/boy.png
  AssetGenImage get boy => const AssetGenImage('assets/images/boy.png');

  /// File path: assets/images/boys.png
  AssetGenImage get boys => const AssetGenImage('assets/images/boys.png');

  /// File path: assets/images/coin.png
  AssetGenImage get coin => const AssetGenImage('assets/images/coin.png');

  /// File path: assets/images/daily.png
  AssetGenImage get daily => const AssetGenImage('assets/images/daily.png');

  /// File path: assets/images/dna.png
  AssetGenImage get dna => const AssetGenImage('assets/images/dna.png');

  /// File path: assets/images/esgul.png
  AssetGenImage get esgul => const AssetGenImage('assets/images/esgul.png');

  /// File path: assets/images/girl.png
  AssetGenImage get girl => const AssetGenImage('assets/images/girl.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/karaktaku.png
  AssetGenImage get karaktaku =>
      const AssetGenImage('assets/images/karaktaku.png');

  /// File path: assets/images/kuis.png
  AssetGenImage get kuis => const AssetGenImage('assets/images/kuis.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/materi.png
  AssetGenImage get materi => const AssetGenImage('assets/images/materi.png');

  /// File path: assets/images/ppaku.jpg
  AssetGenImage get ppaku => const AssetGenImage('assets/images/ppaku.jpg');

  /// File path: assets/images/rbkaraktaku.png
  AssetGenImage get rbkaraktaku =>
      const AssetGenImage('assets/images/rbkaraktaku.png');

  /// File path: assets/images/smp187.jpg
  AssetGenImage get smp187 => const AssetGenImage('assets/images/smp187.jpg');

  /// File path: assets/images/sub1man.png
  AssetGenImage get sub1man => const AssetGenImage('assets/images/sub1man.png');

  /// File path: assets/images/sub2man.png
  AssetGenImage get sub2man => const AssetGenImage('assets/images/sub2man.png');

  /// File path: assets/images/sub3man.png
  AssetGenImage get sub3man => const AssetGenImage('assets/images/sub3man.png');

  /// File path: assets/images/sub4man.png
  AssetGenImage get sub4man => const AssetGenImage('assets/images/sub4man.png');

  /// File path: assets/images/wlp1.png
  AssetGenImage get wlp1 => const AssetGenImage('assets/images/wlp1.png');

  /// File path: assets/images/wpkuis.png
  AssetGenImage get wpkuis => const AssetGenImage('assets/images/wpkuis.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        boy,
        boys,
        coin,
        daily,
        dna,
        esgul,
        girl,
        google,
        karaktaku,
        kuis,
        logo,
        materi,
        ppaku,
        rbkaraktaku,
        smp187,
        sub1man,
        sub2man,
        sub3man,
        sub4man,
        wlp1,
        wpkuis
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
