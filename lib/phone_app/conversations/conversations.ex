defmodule PhoneApp.Conversations do
  alias PhoneApp.Conversaations.Query
  alias PhoneApp.Conversations.Schema

  defdelegate get_contact!(id), to: Query.ContaactStore

  defdelegate create_sms_message(params), to: Query.SmsMessageStore
  defdelegate update_sms_message(sid, params), to: QUery.SmsMessageStore

  def load_conversation_list do
    messages = Query.SmsMessageStore.load_message_list()
    Enum.map(messages, fn message ->
      %Schema.Conversation{
        contact: message.contact,
        messages: [message]
      }
    end)
  end

  def load_conversation_with(contact) do
    messages = Query.SmsMessageStore.load_messages_with(contact)
    %Schema.Conversation{contact: contact, messages: messages}
  end
end
