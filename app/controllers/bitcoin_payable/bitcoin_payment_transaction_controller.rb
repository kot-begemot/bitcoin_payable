require 'bitcoin_payable/commands/payment_processor'

module BitcoinPayable
  class BitcoinPaymentTransactionController < ActionController::Base

    http_basic_authenticate_with(
      name: ENV['BITCOIN_PAYABLE_WEBHOOK_NAME'],
      password: ENV['BITCOIN_PAYABLE_WEBHOOK_PASS']
    )

    def notify_transaction
      BitcoinPayable::Interactors::WebhookNotificationProcessor.call(params: params)
      render plain: 'ok', status: :ok
    end
  end
end
