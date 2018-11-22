unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, Buttons, Menus;

type
  TForm_Search = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    StaticText2: TStaticText;
    SGrd: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    dtpk2: TDateTimePicker;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    dtpk1: TDateTimePicker;
    Button2: TButton;
    Button3: TButton;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    procedure ListBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Update_Sgrid(Sgrd_row: Byte);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    sql_Text:string;
  public
    { Public declarations }
    command_Text:string;
  end;

var
  Form_Search: TForm_Search;

implementation

uses dmo, StaffList;

{$R *.dfm}

procedure TForm_Search.ListBox1Click(Sender: TObject);
begin
  Label1.Visible:=True;
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Visible:=True;
  Edit1.Text:='';
  BitBtn1.Visible:=False;
  ComboBox1.Visible:=False;
  dtpk1.Visible:=False;
  Label2.Visible:=False;
  dtpk2.Visible:=False;
  Button1.Enabled:=False;
  case ListBox1.ItemIndex of
    0:;
    1:
      BitBtn1.Visible:=True;
    2:
    begin
      Label1.Caption:='开始日期:';
      dtpk1.Visible:=True;
      Label2.Visible:=True;
      dtpk2.Visible:=True;
      Button1.Enabled:=True;
    end;
    3:
    begin
      Label1.Caption:='开始日期:';
      dtpk1.Visible:=True;                                        
      Label2.Visible:=True;
      dtpk2.Visible:=True;
      Button1.Enabled:=True;
    end;
  else
    ComboBox1.Visible:=True;
    Button1.Enabled:=True;
  end;

end;

procedure TForm_Search.FormActivate(Sender: TObject);
begin
  SGrd.Cells[0,0]:='条件名';
  SGrd.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
end;

procedure TForm_Search.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    Button1.Enabled:=True
  else
    Button1.Enabled:=False;
end;

procedure TForm_Search.Update_Sgrid(Sgrd_row: Byte);
begin
  SGrd.Cells[0,Sgrd_row]:=ListBox1.Items[ListBox1.ItemIndex];
  SGrd.Cells[1,Sgrd_row]:=Trim(Edit1.Text);
  case ListBox1.ItemIndex of
    0:
      SGrd.Cells[2,Sgrd_row]:=' and employeecardmsg.cardno_dec like ''%'+trim(Edit1.Text)+'%''';
    1:
    begin
      DM.ADOEmployeeMsg.Close;
      DM.ADOEmployeeMsg.CommandText:=sql_Text+' and employeecode='+trim(Edit1.Text);
      DM.ADOEmployeeMsg.Open;
      SGrd.Cells[2,Sgrd_row]:=' and employeecardmsg.employeeid='+inttoStr(DM.ADOEmployeeMsgrkey.Value);
    end;
    2:
    begin
      SGrd.Cells[2,Sgrd_row]:=' and employeecardmsg.begin_time>='''+dateTimetoStr(dtpk1.DateTime)+''' and employeecardmsg.begin_time<='''+dateTimetoStr(dtpk2.DateTime)+'''';
      SGrd.Cells[1,Sgrd_row]:='从'+dateTimetoStr(dtpk1.DateTime)+'到'+dateTimetoStr(dtpk2.DateTime);
    end;
    3:
    begin
      SGrd.Cells[2,Sgrd_row]:=' and employeecardmsg.end_time>='''+dateTimetoStr(dtpk1.DateTime)+''' and employeecardmsg.end_time<='''+dateTimetoStr(dtpk2.DateTime)+'''';
      SGrd.Cells[1,Sgrd_row]:='从'+dateTimetoStr(dtpk1.DateTime)+'到'+dateTimetoStr(dtpk2.DateTime);
    end;
  else
    begin
      SGrd.Cells[2,Sgrd_row]:=' and employeecardmsg.status='+inttoStr(ComboBox1.ItemIndex+1);
      SGrd.Cells[1,Sgrd_row]:=ComboBox1.Text;
    end;
  end;
end;

procedure TForm_Search.FormShow(Sender: TObject);
begin
  sql_Text:=DM.ADOEmployeeMsg.CommandText;
  command_Text:=DM.ADOEmployeeMsg.CommandText;
end;

procedure TForm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_Search.Button1Click(Sender: TObject);
var
  i:Byte;
begin
  for i := 1 to SGrd.RowCount-2 do
  begin
    if SGrd.Cells[0,i]=ListBox1.Items[ListBox1.ItemIndex] then
    begin
      Update_Sgrid(i);
      Exit;
    end;
  end;
  Update_Sgrid(SGrd.RowCount-1);
  SGrd.RowCount:=SGrd.RowCount+1;
end;

procedure TForm_Search.BitBtn1Click(Sender: TObject);
begin
  Form_StaffList:=TForm_StaffList.Create(Application);
  with Form_StaffList.ADOEmployeeMsg do
  begin
    Close;
    if Trim(Edit1.Text)<>'' then
      CommandText:=command_Text+' and employeecode='''+trim(Edit1.Text)+''''
    else
      CommandText:=command_Text;
    Open;
    if IsEmpty then
    begin
      MessageDlg('请输入正确的员工工号',mtInformation,[mbOK],0);
      Edit1.SetFocus;
      Exit;
    end;
  end;
  if Form_StaffList.ShowModal=mrok then
  begin
    Edit1.Text:=Form_StaffList.ADOEmployeeMsgemployeecode.Text;
  end;
end;

procedure TForm_Search.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.ADOEmployeeMsg.Close;
  DM.ADOEmployeeMsg.CommandText:=command_Text;
end;

end.
