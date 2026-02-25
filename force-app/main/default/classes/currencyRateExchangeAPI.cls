public with sharing class currencyRateExchangeAPI {
    public static void getCurrencyRateExchange() {
        try{
            // create request using HttpRequest
            HttpRequest req = new HttpRequest();
            req.setEndPoint('https://open.er-api.com/v6/latest/USD');
            req.setHeader('Content-Type','application/json');
            req.setHeader('accept','application/json');
            req.setMethod('GET');

            // send the request using Http class
            Http htt = new Http();
            HttpResponse res = htt.send(req);
            if(res.getStatusCode() == 200){
                System.debug(res.getBody());
            }
        }catch(System.CalloutException ex){
            if(ex.getMessage().startsWith('System.CalloutException: Unauthorized endpoint')){
                System.debug('Add url inside remote site settings');
            }
        }catch(System.Exception ex){
            System.debug(ex.getMessage());
        }
    }
}