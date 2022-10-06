targetScope = 'resourceGroup'

module appGw 'appgateway.bicep' = {

  name: 'appgateway1'

  params: {

    location: 'centralus'
    agencyCode: 'g00'
    appName:'testApp'
    envCode:'t'
    numberCode:'001'
    sku:'WAF_Medium'
    capacity: 2
    http2Enabled:true
    routingRules: [
      {key:''}
    ]

    subnetName:'subnet'
    vNetName:'vnet'
    diagnosticLogsRetentionInDays:365
    tags: {
        ApplicationName: 'testApp'
        AppPriority: 'dev'
        ChargeCode: '1234'
        DataProtectionCategorization: 'unclassified'
    }
    
    backendPools: [

      {

        name: 'g46tpwcrmweb03.demo.obijuan.com'

        fqdn: 'g46tpwcrmweb03.demo.obijuan.com'

      }

      {

        name: 'g46tpwcrmweb03.demo.obijuan.com'

        fqdn: 'g46tpwcrmweb03.demo.obijuan.com'

      }

    ]

    backendHttpConfigurations: [
      {

        name: 'projectreviewapptest.demo.obijuan.com'

        properties: {

          port: 443

          protocol: 'Https'

          cookieBasedAffinity: 'Disabled'

          hostName: 'projectreviewapptest.demo.obijuan.com'

          pickHostNameFromBackendAddress: false

          affinityCookieName: 'ApplicationGatewayAffinity'

          requestTimeout: 20

          trustedRootCertificates: [

            {

              id: 'certificate' // this must change to an object reference

            }

          ]

        }

      }

    ]

    frontendHttpListeners: [

      {

        name: 'osa-tst.demo.obijuan.com-https'

        frontendIPConfigurationId: ''

        frontendPortId: ''

        hostName: 'osa-tst.demo.obijuan.com'

      }

    ]

  }

}

 

// From ARMJSON to Bicep this is an example BackendPool object:

/*

{

  name: 'g46tpwcrmweb03.demo.obijuan.com'

  properties: {

    backendAddresses: [

      {

        fqdn: 'g46tpwcrmweb03.demo.obijuan.com'

      }

    ]

  }

}

*/

 

// From ARMJSON to Bicep this is an example BackendPool object:

/*

{

  name: 'projectreviewapptest.demo.obijuan.com'

  properties: {

      port: 443

      protocol: 'Https'

      cookieBasedAffinity: 'Disabled'

      hostName: 'projectreviewapptest.demo.obijuan.com'

      pickHostNameFromBackendAddress: false

      affinityCookieName: 'ApplicationGatewayAffinity'

      requestTimeout: 20

      // different object need a reference here...

      trustedRootCertificates: [

          {

              id: [concat(resourceId('Microsoft.Network/applicationGateways' parameters('applicationGateways_g46t_mngeo_shared_agw_001_name')) '/trustedRootCertificates/state-of-mn-root')]

          }

      ]

  }

}

*/

 

// From ARMJSON to Bicep this is an example HttpListener object:

/*

{

  name: osa-tst.demo.obijuan.com-https

  properties: {

      frontendIPConfiguration: {

          id: [concat(resourceId('Microsoft.Network/applicationGateways' parameters('applicationGateways_g46t_mngeo_shared_agw_001_name')) '/frontendIPConfigurations/appGwPublicFrontendIp')]

      }

      frontendPort: {

          id: [concat(resourceId('Microsoft.Network/applicationGateways' parameters('applicationGateways_g46t_mngeo_shared_agw_001_name')) '/frontendPorts/port_443')]

      }

      protocol: Https

      sslCertificate: {

          id: [concat(resourceId('Microsoft.Network/applicationGateways' parameters('applicationGateways_g46t_mngeo_shared_agw_001_name')) '/sslCertificates/osa-tst.demo.obijuan.com')]

      }

      hostName: osa-tst.demo.obijuan.com

      hostNames: []

      requireServerNameIndication: true

  }

}

*/
