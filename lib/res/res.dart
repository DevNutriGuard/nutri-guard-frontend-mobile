import 'package:flutter/cupertino.dart';

import 'sizes.dart';

AppSizes ? sizes;


void initializeResources({required BuildContext context}) {
  AppSizes().initializeSize(context);
  sizes = AppSizes()..initializeSize(context);
}

BuildContext? currentContext;

void setCurrentContext(BuildContext context) {
  currentContext = context;
}

double getWidthRatio() => sizes?.widthRatio ?? 1;

double getHeightRatio() => sizes?.heightRatio ?? 1;

double getFontRatio() => sizes?.fontRatio ?? 1.0;

double getHeight() => sizes?.height ?? 2560;
double getWidth() => sizes?.width ?? 1440;
double commonWidth=getWidth()*.9;
bool checkBottom(){
  return sizes!.bottomInsect>0.0?false:true;
}
