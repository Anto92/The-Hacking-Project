class CryptosController < ApplicationController

    def home
        @crypto_names = ScrapCrypto.new.get_crypto_data
    end

    def show
    	@price = params[:crypto]
    end
end
