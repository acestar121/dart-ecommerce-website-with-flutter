import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/phone/phone_model.dart';
import '../../shared/ui/ui_helpers.dart';
import 'specification_field.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final PhoneModel phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              horizontalSpaceMedium,
              CachedNetworkImage(
                imageUrl: phone.photoUrl!,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red.shade700,
                ),
                fit: BoxFit.contain,
              ),
              horizontalSpaceSmall,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // model
                    SpecificationField(
                      fieldName: 'Model',
                      fieldValue: '${phone.model}',
                    ),
                    // soc
                    SpecificationField(
                      fieldName: 'Soc',
                      fieldValue: '${phone.soc}',
                    ),
                    // ram
                    SpecificationField(
                      fieldName: 'Ram',
                      fieldValue: '${phone.ram} GB',
                    ),
                    // storage
                    SpecificationField(
                      fieldName: 'Storage',
                      fieldValue: '${phone.storage}',
                    ),
                    // screen size
                    SpecificationField(
                      fieldName: 'Screen size',
                      fieldValue: '${phone.screenSize} inch',
                    ),
                    // camera
                    SpecificationField(
                      fieldName: 'Camera',
                      fieldValue: '${phone.camera}',
                    ),
                    // sar
                    SpecificationField(
                      fieldName: 'SAR',
                      fieldValue: '${phone.sar} W/kg',
                    ),
                    // price
                    SpecificationField(
                      fieldName: 'Price',
                      fieldValue: '€${phone.price}',
                    ),
                    // quantity
                    SpecificationField(
                      fieldName: 'Stock',
                      fieldValue: '${phone.quantity}',
                    ),
                  ],
                ),
              ),
              horizontalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
