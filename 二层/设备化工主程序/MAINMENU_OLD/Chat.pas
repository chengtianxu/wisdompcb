unit Chat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ScktComp, ExtCtrls, ComCtrls, ImgList;

type
  TChatForm = class(TForm)
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    Memo1: TMemo;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    edit2: TEdit;
    ListView1: TListView;
    CheckBox1: TCheckBox;
    ImageList1: TImageList;
    Edit1: TEdit;
    IP_ADD: TLabel;
    TP: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure loadUsers();
    procedure CheckBox1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
  end;

var
  ChatForm: TChatForm;
  Server: String;
  IsServer: Boolean;

implementation

uses datamodule,mainform;

{$R *.DFM}


procedure TChatForm.FormCreate(Sender: TObject);
begin
  edit2.Enabled:=false;
  bitbtn2.Enabled :=false;
  memo1.ReadOnly :=true;
  statusbar1.Panels.Add;
  Statusbar1.Panels[0].Text := '空闲...';
end;

procedure TChatForm.edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  BitBtn2Click(sender);
end;

procedure TChatForm.BitBtn2Click(Sender: TObject);
begin
  dm.ADODate.close;
  dm.ADODate.Open;
  if edit2.text<>'' then
  begin
    memo1.Lines.add('[发给'+trim(Edit1.text)+' '+dm.Adodate.fieldbyname('vdt').Asstring+']：'+edit2.text);
    if IP_ADD.Caption ='0' then
    begin
      if IsServer then
        FrmMainMenu.ServerSocket.Socket.Connections[0].SendText(edit2.text+'IPADDRESS_KMERP'+dm.ADOUser.fieldbyname('network_id').asstring+'_'+dm.ADOUser.fieldbyname('employee_name').asstring)
      else
        FrmMainMenu.ClientSocket.Socket.SendText(edit2.text+'IPADDRESS_KMERP'+dm.ADOUser.fieldbyname('network_id').asstring+'_'+dm.ADOUser.fieldbyname('employee_name').asstring)
    end else
    begin
      With dm.ADO0014 do
      begin
        close;
        parameters.ParamByName('@vptr').Value :=0;
        open;
        append;
        Fieldbyname('empl_ptr').AsString :=IP_ADD.Caption;
        Fieldbyname('message').AsString :='[来自'+FrmMainmenu.StatusBar1.Panels[2].Text+' '+dm.Adodate.fieldbyname('vdt').Asstring+']'+Edit2.text;
        post;
      end;
    end;
  end;
  edit2.Text:='';
  edit2.SetFocus;
end;

procedure TChatForm.FormActivate(Sender: TObject);
begin
  if tp.caption='1' then
  begin
    with DM.ADOUser do
    begin
      close;
      sql.Clear ;
      sql.Add('select data0005.rkey,data0005.employee_name,data0073.network_id');
      sql.Add('from data0073,data0005 ');
      sql.Add('where data0073.employee_ptr=data0005.rkey');
      sql.Add('and data0073.network_id='''+trim(chat.Server)+'''');
      prepared;
      open;
    end;
    ChatForm.IP_ADD.Caption :='0';
    ChatForm.Edit1.text := dm.ADOUser.fieldbyname('employee_name').asstring;
  end;

  loadUsers();
  With dm.ADO0014 do
  begin
    close;
    parameters.ParamByName('@vptr').Value :=dm.ADOData0073.fieldbyname('employee_ptr').AsString;
    open;
  end;
  With dm.ADO0014 do
  while not eof do
  begin
    Memo1.Lines.Add(Fieldbyname('message').AsString);
    next;
  end;
  With dm.ADO0014a do
  begin
    close;
    parameters.ParamByName('@vptr').Value :=dm.ADOData0073.fieldbyname('employee_ptr').AsString;
    ExecProc;
  end;
  With dm.ADO0014 do
  begin
    close;
    parameters.ParamByName('@vptr').Value :=dm.ADOData0073.fieldbyname('employee_ptr').AsString;
    open;
  end;

end;

procedure TChatForm.loadUsers();
var
  ListItem:TlistItem;
begin
  with DM.ADOUser do
  begin
    close;
    sql.Clear ;
    sql.Add('select data0005.rkey,data0005.employee_name,data0073.network_id ');
    sql.Add('from data0073,data0005 ');
    sql.Add('where data0073.employee_ptr=data0005.rkey');
    sql.Add('and Data0073.rkey<>'+dm.ADOData0073.fieldbyname('rkey').asstring);
    if Checkbox1.Checked then
      sql.Add('and len(network_id)>0 ');
    sql.Add('order by data0005.employee_name');
    prepared;
    open;
  end;
  ListView1.items.clear;
  with DM.ADOUser do
  while not eof do
  begin
      with ListView1 do
      begin
        ListItem := Items.Add;
        ListItem.Caption:= trim(DM.ADOUser.fieldbyname('employee_name').asstring);
        if trim(DM.ADOUser.fieldbyname('network_id').asstring)<>'' then
          ListItem.ImageIndex :=0
        else
          ListItem.ImageIndex :=1;
      end;
      next;
  end;
end;

procedure TChatForm.CheckBox1Click(Sender: TObject);
begin
  loadUsers();
end;

procedure TChatForm.ListView1DblClick(Sender: TObject);
begin
  if Listview1.Selected=nil then exit;
  Edit1.Text :=Listview1.Selected.Caption;
  dm.ADOUser.MoveBy(Listview1.Selected.Index+1-dm.ADOUser.RecNo);
  if Listview1.Selected.ImageIndex=0 then
  begin
    FrmMainMenu.ClientSocket.Active := False;
    FrmMainMenu.ServerSocket.Active := false;
    FrmMainMenu.ServerSocket.Active := True;
    IP_ADD.Caption :='0';
    edit2.Enabled:=true;
    bitbtn2.Enabled :=true;
    if FrmMainMenu.ClientSocket.Active then FrmMainMenu.ClientSocket.Active := False;
    with FrmMainMenu.ClientSocket do
    begin
      server:=trim(DM.ADOUser.fieldbyname('network_id').asstring);
      Host := Server;
      Active := True;
    end;
  end else
  begin
    IP_ADD.Caption :=DM.ADOUser.fieldbyname('rkey').asstring;
    edit2.Enabled:=true;
    bitbtn2.Enabled :=true;
    FrmMainMenu.ClientSocket.Active := False;
    FrmMainMenu.ServerSocket.Active := false;
    FrmMainMenu.ServerSocket.Active := True;
  end;
end;

procedure TChatForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edit2.Enabled:=false;
  bitbtn2.Enabled :=false;
  tp.caption:='0';
end;

end.
