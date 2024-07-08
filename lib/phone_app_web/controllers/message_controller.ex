defmodule PhoneApp.MessageController do
  use PhoneAppWeb, :controller

  plug :load_conversation_list

  def index(conn, _params) do
    case conn.assigns.conversation_list do
      [%{contact: contact} | _] ->
        path = ~p(/messages/#{contact.id})
        redirect(conn, to: path)

      [] ->
        redirect(conn, to: ~p(/messages/new))
    end
  end

  defp load_conversation_list(conn, _params) do
    conversations = PhoneApp.Conversations.load_conversation_list()
    assign(conn, :conversation_list, conversations)
  end
end
