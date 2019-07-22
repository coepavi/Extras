
#!/bin/bash

function autoCurl()
{
# Excel file header record. It will be written into outFile.xls file

header0='System_Name'
header1='Transaction_Status'
header2='Details'
header3='KeyValue'

echo $header0, $header1, $header2, $header3  >> outFile.xls

	keyField=0
    for((i=140; i<=150; i++))
    {
		keyField=$((0+i))

echo "------------ &&& DAP &*&**** ---- "
		
echo "POST DAP delivery chaincode "
echo

outMessage=$(curl -s -X POST \
  http://localhost:4000/channels/Delivery \
  -H "content-type: application/json" \
  -d "{
  \"ZDELVRY03_IS105\" : {
    \"E1EDL20\" : {
      \"XABLN\" : \"6000001103\",
      \"E1EDL24\" : {
        \"MATNR\" : \"85720115560\",
        \"E1EDL43\" : [
          {
            \"QUALF\" : \"C\",
            \"BELNR\" : \"0100000394\"
          },
          {
            \"QUALF\" : \"J\",
            \"BELNR\" : \"900400071\"
          }
        ],
        \"E1EDL41\" : {
          \"BSTNR\" : \"$keyField\"
        }
      }
    }
  }
}")

echo $outMessage
system='DAP'

out=$(echo $outMessage | cut -d ' ' -f 1)

if [ $out == 'Successfully' ]
then
	echo $system, $pass, $outMessage, $keyField  >> outFile.xls
else
	echo $system, $fail, $outMessage, $keyField  >> outFile.xls
fi	


echo "POST DAP invoice <  > ----- "
echo

outMessage=$(curl -s -X POST \
  http://localhost:4000/channels/InvoiceResponse \
  -H "content-type: application/json" \
  -d "{
    \"ZEXPINV4_IV01\" : {
    \"IDOC\" : {
      \"E1EDK01\" : {
        \"CURCY\" : \"EUR\",
        \"HWAER\" : \"EUR\",
        \"WKURS\" : \"1.00000\",
        \"ZTERM\" : \"P005\",
        \"BELNR\" : \"0891000025\",
        \"NTGEW\" : \"0.083\",
        \"BRGEW\" : \"0.083\",
        \"GEWEI\" : \"KGM\",
        \"RECIPNT_NO\" : \"0000805222\",
        \"Z1EDK01_IV01\" : {
         \"VBUND\" : \"805222\"
        }
      },
      \"E1EDKA1\" : [
        {
          \"PARVW\" : \"RS\",
          \"PARTN\" : \"113346\",
          \"LIFNR\" : \"0000805222\"
        },
        {
          \"PARVW\" : \"LF\",
          \"PARTN\" : \"0000802851\"
        },
        {
          \"PARVW\" : \"ZU\",
          \"PARTN\" : \"0000166564\"
        },
        {
          \"PARVW\" : \"ZY\",
          \"PARTN\" : \"0000166616\"
        }
      ],
      \"E1EDK02\" : [
        {
          \"QUALF\" : \"009\",
          \"BELNR\" : \"0991000025\",
          \"DATUM\" : \"20190327\"
        },
        {
          \"QUALF\" : \"061\",
          \"BELNR\" : \"0000001124\",
          \"DATUM\" : \"20190327\"
        },
        {
          \"QUALF\" : \"001\",
          \"BELNR\" : \"4500243701\",
          \"DATUM\" : \"20190327\"
        }
      ],
      \"E1EDK05\" : {
        \"ALCKZ\" : \"+\",
        \"KSCHL\" : \"ZVPR\",
        \"BETRG\" : \"13.02\",
        \"KOEIN\" : \"EUR\"
      },
      \"E1EDK04\" : {
        \"MWSKZ\" : \"ZA\"
      },
      \"E1EDK17\" : {
        \"QUALF\" : \"002\",
        \"LKOND\" : \"CIP\",
        \"LKTEXT\" : \"Moreno Valley\"
      },
      \"E1EDP01\" : {
        \"POSEX\" : \"000001\",
        \"MENGE\" : \"1.000\",
        \"MENEE\" : \"PCE\",
        \"NTGEW\" : \"0.083\",
        \"GEWEI\" : \"KGM\",
        \"BRGEW\" : \"0.083\",
        \"WERKS\" : \"NL59\",
        \"Z1EDP01\" : {
          \"VOLEH\" : \"MTQ\",
          \"BTVOL\" : \"0.000\"
        },
        \"E1EDP02\" : {
          \"QUALF\" : \"001\",
          \"BELNR\" : \"$keyField\",
          \"ZEILE\" : \"000010\"
        },
        \"E1EDP26\" : {
          \"QUALF\" : \"002\",
          \"BETRG\" : \"13.02\"
        },
        \"E1EDP05\" : {
          \"ALCKZ\" : \"+\",
          \"KSCHL\" : \"ZVPR\",
          \"BETRG\" : \"13.02\"
        },
        \"E1EDP04\" : {
          \"MWSKZ\" : \"ZA\"
        },
        \"E1EDP19\" : {
          \"QUALF\" : \"002\",
          \"IDTNR\" : \"885720115560\"
        }
      }
    }
  }
}")

echo $outMessage
system='DAP'

out=$(echo $outMessage | cut -d ' ' -f 1)

if [ $out == 'Successfully' ]
then
	echo $system, $pass, $outMessage, $keyField  >> outFile.xls
else
	echo $system, $fail, $outMessage, $keyField  >> outFile.xls
fi	

echo "---------------> FIL ****** ---- "

echo "POST invoke FIL chaincode "
echo
outMessage=$(curl -s -X POST \
  http://localhost:4000/channels/FilInvoice \
  -H "content-type: application/json" \
  -d "{
  \"ZINVOIC02\" : {
    \"IDOC\" : {
      \"E1EDK01\" : {
        \"CURCY\" : \"USD\",  
        \"HWAER\" : \"EUR\",
        \"WKURS\" : \"72.55051\",
        \"ZTERM\" : \"124\",
        \"EIGENUINR\" : \"NL009807184B01\",
        \"BSART\" : \"INVO\",
        \"BELNR\" : \"6535000369\",
        \"NTGEW\" : \"2316.000\",
        \"BRGEW\" : \"2496.000\",
        \"GEWEI\" : \"KGM\",
        \"FKART_RL\" : \"LR\",
        \"RECIPNT_NO\" : \"0000166564\",
        \"FKTYP\" : \"L\"
      },
      \"E1EDKA1\" : [
        {
          \"PARVW\" : \"RS\",
          \"PARTN\" : \"805222\",
          \"LIFNR\" : \"0000166564\",
          \"NAME1\" : \"Consumer Lifestyle\",
          \"NAME2\" : \"NL28 805222 NL re-invoicing (EUR)\",
          \"STRAS\" : \"Amstelplein 2\",
          \"PFACH\" : \"80048\",
          \"ORT01\" : \"Amsterdam\",
          \"PSTLZ\" : \"1096 BC\",
          \"PSTL2\" : \"5600 JZ\",
          \"LAND1\" : \"NL\",
          \"SPRAS\" : \"E\",
          \"BNAME\" : \"12\",
          \"PAORG\" : \"NL28\"
        },
        {
          \"PARVW\" : \"AG\",
          \"PARTN\" : \"0000166564\",
          \"LIFNR\" : \"805222\",
          \"NAME1\" : \"Lifestyle\",
          \"NAME2\" : \"North America DC\",
          \"STRAS\" : \"1600 Summer Street\",
          \"PFACH\" : \"120015\",
          \"ORT01\" : \"STAMFORD\",
          \"PSTLZ\" : \"069055125\",
          \"PSTL2\" : \"069120015\",
          \"LAND1\" : \"US\",
          \"SPRAS\" : \"E\",
          \"ORT02\" : \"FAIRFIELD\",
          \"REGIO\" : \"CT\",
          \"IHREZ\" : \"0991000042\",
          \"ILNNR\" : \"8713381665646\",
          \"SPRAS_ISO\" : \"EN\"
        }
      ],
      \"E1EDK02\" : [
        {
          \"QUALF\" : \"001\",
          \"BELNR\" : \"0991000042\",
          \"DATUM\" : \"20190428\"
        }
      ],
      \"E1EDK17\" : [
        {
          \"QUALF\" : \"002\",
          \"LKOND\" : \"FOB\",
          \"LKTEXT\" : \"Moreno Valley\"
        }
      ],
      \"E1EDK18\" : [
        {
          \"QUALF\" : \"001\",
          \"TAGE\" : \"60\",
          \"PRZNT\" : \"0\",
          \"ZTERM_TXT\" : \"Up to 06/29/2019 without deduction\"
        },
        {
          \"QUALF\" : \"005\",
          \"ZTERM_TXT\" : \"< 60 days after eom invoicing\"
        }
      ],
      \"E1EDP01\" : [
        {
          \"POSEX\" : \"000010\",
          \"MENGE\" : \"12.000\",
          \"MENEE\" : \"PCE\",
          \"NTGEW\" : \"2316.000\",
          \"GEWEI\" : \"KGM\",
          \"BRGEW\" : \"2496.000\",
          \"PSTYV\" : \"ZL2C\",
          \"WERKS\" : \"NL2A\",
          \"E1EDP02\" : [
            {
              \"QUALF\" : \"001\",
              \"BELNR\" : \"$keyField\",
              \"DATUM\" : \"20190428\"
            }
          ],
          \"E1EDP26\" : [
            {
              \"QUALF\" : \"002\",
              \"BETRG\" : \"159.00\"
            }
          ]
        }
      ],
      \"E1EDS01\" : [
        {
          \"SUMID\" : \"011\",
          \"SUMME\" : \"159.00\", 
          \"WAERQ\" : \"USD\"     
          }
      ]
    }
  }
}")
echo $outMessage
system='FIL'

out=$(echo $outMessage | cut -d ' ' -f 1)

if [ $out == 'Successfully' ]
then
	echo $system, $pass, $outMessage, $keyField  >> outFile.xls
else
	echo $system, $fail, $outMessage, $keyField  >> outFile.xls
fi	


echo "---------------> PIL _____________"

echo "POST invoke cURL command to call chaincode "
echo
outMessage=$(curl -s -X POST \
  http://localhost:4000/channels/PilInvoice \
  -H "content-type: application/json" \
  -d "{
   \"ZGSVERFBC\":{
   \"IDOC\": {
      \"Z1BCHEAD\": {
         \"BELNR\": \"$keyField\",
         \"GJAHR\": \"2019\",
         \"BUKRS\": \"US19\",
         \"LIFNR\": \"530855222\",
         \"BUDAT\": \"845490515\",
         \"MENGE\": \"1.000\",
         \"RMWWR\": \"10.00\",
         \"WAERS\": \"USD\",
         \"KURSF\": \"1.00000\",
         \"EBELN\": \"956363785230\",
         \"EBELP\": \"00010\",
         \"MATNR\": \"1488820215560\",
         \"WERKS\": \"US01\"
      }
   }
}
}") 

echo $outMessage
system='PIL'

out=$(echo $outMessage | cut -d ' ' -f 1)

if [ $out == 'Successfully' ]
then
	echo $system, $pass, $outMessage, $keyField  >> outFile.xls
else
	echo $system, $fail, $outMessage, $keyField  >> outFile.xls
fi	
	
}
}

# Main para
starttime=$(date +%s)
# calling autoCurl function in loop
pass='Success'
fail='Fail'
autoCurl
echo "Total execution time : $(($(date +%s)-starttime)) secs ..."


