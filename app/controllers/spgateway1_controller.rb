class Spgateway1Controller < ActionController::Base

  # def return
    # hash_key = "TYiU1DmujbmURuMe0Htc6sep2Er4xD0L"
    # hash_iv = "JhTNuxOHK7jDcZQQ"
    # trade_info = spagatway_params['TradeInfo']
    # trade_sha = spagatway_params['TradeSha']

    # str = "HashKey=#{hash_key}&#{trade_info}&HashIV=#{hash_iv}"
    # check_sha = Digest::SHA256.hexdigest(str).upcase

    # if check_sha == trade_sha
    #   decipher = OpenSSL::Cipher::AES256.new(:CBC)
    #   decipher.decrypt
    #   decipher.padding = 0
    #   decipher.key = hash_key
    #   decipher.iv = hash_iv

    #   binary_encrypted = [trade_info].pack('H*') # hex to binary
    #   plain = decipher.update(binary_encrypted) + decipher.final

    #   # strip last padding
    #   if plain[-1] != '}'
    #     plain = plain[0, plain.index(plain[-1])]
    #   end
    #   data = JSON.parse(plain)
    # end

  #   data = Spgateway1.decrypt(trade_info, trade_sha)

  #   if data
  #     payment = Payment.find(data['Result']['MerchantOrderNo'].to_i)
  #     if params['Status'] == 'SUCCESS'
  #       payment.paid_at = Time.now
  #     end
  #     payment.params = data
  #   end

  #   if payment&.save
  #     rail_order = payment.rail_order
  #     rail_order.update(rail_payment_status: "paid")
  #     # send paid email
  #     flash[:notice] = "#{payment.sn} paid"
  #   else
  #     flash[:alert] = "Something wrong!!!"
  #   end
  #   redirect_to rail_orders_path
  # end

  # private

  # def spagatway_params
  #   params.slice("Status", "MerchantID", "Version", "TradeInfo", "TradeSha")
  # end
  
end