<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileContractor/UnderPage.master" AutoEventWireup="true" CodeFile="ConversationHirer.aspx.cs" Inherits="ProfileHirer_ConversationHirer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <div style="width:200px">
<asp:DataList ID="DLContractorList" runat="server" DataKeyField="UserName"
        onitemcommand="DLContractorList_ItemCommand">
    <ItemTemplate>
        <asp:LinkButton ID="lkContractor" runat="server" Text='<%#Eval("UserName") %>' CommandName="ContractorUserName" ></asp:LinkButton>
    </ItemTemplate>
    </asp:DataList>
</div>
<div style="width:200px">
    <asp:Label ID="lblContractorUserName" runat="server" Text=""></asp:Label>

<%--  
<asp:Timer ID="Timer1" runat="server" Interval="120" OnTick="Timer1_Tick">
</asp:Timer>--%>
<br />
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
--%>
<asp:DataList ID="DLConversion" runat="server" Width="500px" Font-Size="15px" 
        onitemcommand="DLConversion_ItemCommand" 
        onitemdatabound="DLConversion_ItemDataBound" 
        onitemcreated="DLConversion_ItemCreated">
    <ItemTemplate>
    <table width="100%">
    <tr>
    <td>
        <asp:Label ID="lblSender" runat="server" Text='<%#Eval("SendBy") %>'></asp:Label></td>
    <td> <asp:Label ID="lblSenderMsg" runat="server" Text='<%#Eval("Message") %>'></asp:Label></td>
    <td></td>
    </tr>
    <tr>
    <td>Attach</td>
    <td>
        <asp:HyperLink ID="HLDownload" runat="server" Target="_blank"  NavigateUrl='<%#Eval("Attachment") %>'>Download</asp:HyperLink>
        </td>
        <td>
        <asp:Label ID="lblPostDate" runat="server" Text='<%#Eval("PostDate") %>'></asp:Label>
        </td>
    </tr>
    </table>
    </ItemTemplate>
    </asp:DataList>
<%--</ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="Timer1" />
</Triggers>
</asp:UpdatePanel>--%>
     <table>
    <tr>
    <td>
        Replay</td>
    <td> 
        <textarea id="txtReplayMsg" cols="20" rows="2" runat="server"></textarea></td>
    </tr>
    <tr>
    <td>
        <asp:FileUpload ID="FUAttachment" runat="server" />
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="BtnSend" runat="server" Text="Send" onclick="BtnSend_Click" />
    </td>
    </tr>
  </table>
  </div>
</asp:Content>