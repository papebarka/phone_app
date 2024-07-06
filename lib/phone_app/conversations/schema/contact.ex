defmodule PhoneApp.Conversations.Schema.Contact do
  use Ecto.Schema

  @timestamps_opts [type: :utc_datetime_usec]

  schema "contacts" do
    has_many :sms_messages, PhoneApp.Conversations.Schema.SmsMessage

    field :phone_number, :string
    field :name, :string

    timestamps()
  end

end
