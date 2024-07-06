defmodule PhoneApp.Conversations.Schema.SmsMessage do
  use Ecto.Schema

  @timestamps_opts [type: :utc_datetime_usec]
  schema "sms_messages" do

    belongs_to :contact, PhoneApp.Conversations.Schema.Contact

    field :message_sid, :string

    field :account_sid, :string

    field :body, :string

    field :from, :string

    field :to, :string

    field :status, :string

    field :direction, Ecto.Enum, values: [:incoming, :outgoing]

    timestamps()
  end
end
