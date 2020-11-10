import 'package:e_commerce_app/core/functions/get_device_type.dart';
import 'package:e_commerce_app/core/models/device_info.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
 final Widget Function(BuildContext context,DeviceInfo  deviceInfo)builder;

  const InfoWidget({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains){
        var mediaQeryData=MediaQuery.of(context);
        var deviceInfo=DeviceInfo(
          orientation: mediaQeryData.orientation,
          deviceType: getDeviceType(mediaQeryData),
          screenWidth: mediaQeryData.size.width,
          screenHeight: mediaQeryData.size.height,
          localHeight: constrains.maxHeight,
          localWidth: constrains.maxWidth
        );
        return builder(context,deviceInfo);
      },
    );
  }
}
