import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';

iconAssetImage(
    String image,[
      double? size,
      Color?color,
    ]
    )=> SvgPicture.asset(
  height: size ?? 27,
  width:  size ?? 27,
  image,
  color: color,
);