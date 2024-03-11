class Stock < ApplicationRecord
    has_many:user_stocks
    has_many:users,through: :user_stocks
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex[:pub_key],
            secret_token: Rails.application.credentials.iex[:sec_key],
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        begin
            Stock.new(ticker:ticker_symbol,name:client.company(ticker_symbol).company_name,last_price:client.price(ticker_symbol))
        rescue
            return nil
        end
    end
end
