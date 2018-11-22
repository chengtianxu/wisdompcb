unit Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ComCtrls, Menus;

type
  TForm_Query = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    btnInsert: TButton;
    StaticText2: TStaticText;
    Label2: TLabel;
    SGrid1: TStringGrid;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
    procedure SaveGrid(g:TStringGrid;list:TStringList);
    procedure LoadGrid(g:TStringGrid;list:TStringList);
  public
    { Public declarations }
    leave_Type:string;
    list:TStringList;
  end;

var
  Form_Query: TForm_Query;

implementation

uses Single, dmo, Single1;

{$R *.dfm}

procedure TForm_Query.ListBox1Click(Sender: TObject);
begin
  Edit1.Visible:=true;
  edit1.Text:='';
  bitbtn1.Visible:=True;
  combobox1.Visible:=false;
  CheckBox1.Visible:=False;
  btnInsert.Enabled:=false;
  Label1.Caption:=ListBox1.Items[ListBox1.itemIndex];
  case ListBox1.ItemIndex of
    0:
    begin
    end;
    1:
    begin
      Label1.Visible:=True;
      btnInsert.Enabled:=True;
      Edit1.Visible:=False;
      BitBtn1.Visible:=False;
      ComboBox1.Visible:=True;
      CheckBox1.Visible:=False;
    end;
    2:
    begin
    end;
  else
    Edit1.Visible:=False;
    BitBtn1.Visible:=False;
    ComboBox1.Visible:=False;
    Label1.Visible:=False;
    CheckBox1.Visible:=True;
    btnInsert.Enabled:=True;
  end;
end;

procedure TForm_Query.FormShow(Sender: TObject);
var
  i:Byte;
begin
  ListBox1.ItemIndex:=0;
  Label1.Caption:=ListBox1.Items[ListBox1.itemIndex];
  ComboBox1.Visible:=False;
  CheckBox1.Visible:=False;
end;

procedure TForm_Query.BitBtn1Click(Sender: TObject);
begin
  try
    Form_Single:=TForm_Single.Create(Application);
    Form_Single1:=TForm_Single1.Create(Application);
    if Trim(Edit1.Text)<>'' then
    begin
      if ListBox1.ItemIndex=0 then
      begin
        DM.ADOemployeemsg.Close;
        DM.ADOemployeemsg.Parameters[0].Value:=StrToInt(Trim(Edit1.Text));
        DM.ADOemployeemsg.Open;
      end;
      if ListBox1.ItemIndex=2 then
      begin
        Form_Single1.ADO0073.Close;
        Form_Single1.ADO0073.Parameters[0].Value:=StrToInt(Trim(Edit1.Text));
        Form_Single1.ADO0073.Open;
      end;
    end
    else
    begin
      if ListBox1.ItemIndex=0 then
      begin
        DM.ADOemployeemsg.Close;
        DM.ADOemployeemsg.Parameters[0].Value:='';
        DM.ADOemployeemsg.Open;
      end;
      if ListBox1.ItemIndex=2 then
      begin
        Form_Single1.ADO0073.Close;
        Form_Single1.ADO0073.Parameters[0].Value:='';
        Form_Single1.ADO0073.Open;
      end;
    end;
    if ListBox1.ItemIndex=0 then
    begin
      if DM.ADOemployeemsg.IsEmpty then
      begin
        messagedlg('请输入正确的员工代码!',mtinformation,[mbok],0);
        Edit1.SetFocus;
      end
      else
      begin
        if Form_Single.ShowModal=mrok then
        begin
          Edit1.Text:=DM.ADOemployeemsgemployeecode.Value;
          Edit1.Font.Color:=clWindowText;
        end;
      end;
    end;
    if ListBox1.ItemIndex=2 then
    begin
      if Form_Single1.ADO0073.IsEmpty then
      begin
        messagedlg('请输入正确的员工代码!',mtinformation,[mbok],0);
        Edit1.SetFocus;
      end
      else
      begin
        if Form_Single1.ShowModal=mrok then
        begin
          Edit1.Text:=Form_Single1.ADO0073USER_LOGIN_NAME.Value;
          Edit1.Font.Color:=clWindowText;
        end;
      end;
    end;
  finally
    Form_Single.Free;
  end;
end;

procedure TForm_Query.btnInsertClick(Sender: TObject);
var
  i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if SGrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(SGrid1.RowCount-1);
  SGrid1.RowCount:=SGrid1.RowCount+1;
  
end;

procedure TForm_Query.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Query.ComboBox1Change(Sender: TObject);
begin
  leave_Type:=Trim(ComboBox1.Text);
end;

procedure TForm_Query.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Query.BitBtn3Click(Sender: TObject);
var
  i:Byte;
begin
  for i :=1  to SGrid1.RowCount-1 do
  begin
    SGrid1.Rows[i].Clear;
  end;
  SGrid1.RowCount:=2;
end;

procedure TForm_Query.BitBtn2Click(Sender: TObject);
begin
  SaveGrid(SGrid1,list);
  ModalResult:=mrOk;
end;

procedure TForm_Query.FormActivate(Sender: TObject);
begin
  SGrid1.Cells[0,0]:='条件名称';
  SGrid1.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
  if list.Count>0 then
  begin
    LoadGrid(SGrid1,list);
  end;
end;

procedure TForm_Query.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    btnInsert.Enabled:=True
  else
    btnInsert.Enabled:=False;
end;

procedure TForm_Query.update_sgrid(sgrid_row: byte);
begin
  SGrid1.Cells[0,sgrid_row]:=ListBox1.Items[ListBox1.itemIndex];
  DM.ADOAskForLeave.Close;
  DM.ADOAskForLeave.Parameters[0].Value:=leave_Type;
  DM.ADOAskForLeave.Open;
  case ListBox1.ItemIndex of
    0:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrid1.Cells[2,sgrid_row]:=' and AskLeaveRegister.employeeid='+dm.ADOemployeemsgrkey.Text;
    end;
    1:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(ComboBox1.Text);
      SGrid1.Cells[2,sgrid_row]:=' and AskLeaveRegister.leavetype='+dm.ADOAskForLeaverkey.Text;
    end;
    2:
    begin
      SGrid1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrid1.Cells[2,sgrid_row]:=' and AskLeaveRegister.RegisterMan='+Form_Single1.ADO0073EMPLOYEE_PTR.Text;
    end;
  else
    if CheckBox1.Checked then
    begin
      SGrid1.Cells[1,sgrid_row]:='是';
      SGrid1.Cells[2,sgrid_row]:='and AskLeaveRegister.CurStatus='+inttostr(1);
    end
    else
    begin
      SGrid1.Cells[1,sgrid_row]:='否';
      SGrid1.Cells[2,sgrid_row]:='and AskLeaveRegister.CurStatus='+inttostr(0);
    end;
  end;
end;

procedure TForm_Query.N1Click(Sender: TObject);
var
  i:Byte;
begin
  if SGrid1.RowCount>2 then
  begin
    for i:=SGrid1.Row to SGrid1.RowCount-2 do
      SGrid1.Rows[i].Text:=SGrid1.Rows[i+1].Text;
    SGrid1.RowCount:=SGrid1.RowCount-1;
  end
  else SGrid1.Rows[SGrid1.Row].Clear;
end;

procedure TForm_Query.SaveGrid(g:TStringGrid;list:TStringList);
var i:integer;
begin
  list.Clear;
  for i:=0 to g.RowCount-1 do
  begin
    g.Rows[i].Delimiter:=',';
    list.Add(g.Rows[i].DelimitedText);
  end;
end;

procedure TForm_Query.LoadGrid(g:TStringGrid;list:TStringList);
var i:integer;
begin
  g.RowCount:=list.Count;
  for i:=0 to list.Count-1 do
  begin
    g.Rows[i].Delimiter:=',';
    g.Rows[i].DelimitedText:=list.Strings[i];
  end;
end;
end.
