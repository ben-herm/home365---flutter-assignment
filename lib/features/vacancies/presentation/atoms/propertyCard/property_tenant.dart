import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';
import '../../../model/tenant/tenant_model.dart';

class PropertyTenant extends StatelessWidget {
  const PropertyTenant({
    required this.tenant,
    Key? key,
  }) : super(key: key);

  final TenantModel tenant;

  @override
  Widget build(BuildContext context) {
    final tenantName = '${tenant.firstName} ${tenant.lastName}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        CustomText(
          'Tenant Name: ' + tenantName,
          textAlign: TextAlign.left,
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: T.colors.red,
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          'Tenant Status: ' + tenant.tenantStatus,
          textAlign: TextAlign.left,
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: T.colors.red,
          ),
        ),
      ],
    );
  }
}
