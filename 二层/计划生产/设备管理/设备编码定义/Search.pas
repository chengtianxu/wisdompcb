unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons, Menus;

type
  TFrm_Search = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    StaticText2: TStaticText;
    SGrd1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    dtpk1: TDateTimePicker;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure update_sgrid(sgrid_row: byte);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Search: TFrm_Search;

implementation

uses dmo, units, employee;

{$R *.dfm}

procedure TFrm_Search.FormShow(Sender: TObject);
begin
  SGrd1.Cells[0,0]:='条件名';
  SGrd1.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
end;

procedure TFrm_Search.ListBox1Click(Sender: TObject);
begin
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Visible:=True;
  Edit1.Text:='';
  BitBtn1.Visible:=False;
  ComboBox2.Visible:=False;
  ComboBox3.Visible:=False;
  Button1.Enabled:=False;
  dtpk1.Visible:=False;
  Label3.Visible:=False;
  dtpk2.Visible:=False;
  case ListBox1.ItemIndex of
    0: ;
    1: ;
    2: ;
    3: ;
    4:
    begin
      Edit1.Visible:=False;
      ComboBox2.Visible:=True;
      Button1.Enabled:=True;
    end;
    5:
    begin
      Edit1.Visible:=False;
      ComboBox3.Visible:=True;
      Button1.Enabled:=True;
    end;
    6: BitBtn1.Visible:=True;
    7: BitBtn1.Visible:=True;
    8: BitBtn1.Visible:=True;
    9:
    begin
      Label1.Caption:='从';
      Label3.Visible:=True;
      dtpk1.Visible:=True;
      dtpk2.Visible:=True;
      Button1.Enabled:=True;
    end;
    10:
    begin
      Label1.Caption:='从';
      Label3.Visible:=True;
      dtpk1.Visible:=True;
      dtpk2.Visible:=True;
      Button1.Enabled:=True;
    end;
  end;
end;

procedure TFrm_Search.Button1Click(Sender: TObject);
var
  i:byte;
begin
  for i:=1 to SGrd1.RowCount-2 do
   if SGrd1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(SGrd1.RowCount-1);
  SGrd1.RowCount:=SGrd1.RowCount+1;
end;

procedure TFrm_Search.update_sgrid(sgrid_row: byte);
begin
  SGrd1.Cells[0,sgrid_row]:=ListBox1.Items[ListBox1.itemIndex];
  case ListBox1.ItemIndex of
    0:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.fasset_code like ''%'+trim(Edit1.Text)+'%''';
    end;
    1:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.fasset_name like ''%'+trim(Edit1.Text)+'%''';
    end;
    2:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.location like ''%'+trim(Edit1.Text)+'%''';
    end;
    3:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.fasset_desc like ''%'+trim(Edit1.Text)+'%''';
    end;
    4:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(ComboBox2.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0514 where fasset_type='''+Trim(ComboBox2.Text)+'''');
        Active:=True;                                         
      end;
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.fasset_type_ptr='+IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    end;
    5:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(ComboBox3.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0015 where abbr_name='''+Trim(ComboBox3.Text)+'''');
        Active:=True;
      end;
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.warehouse_ptr='+IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    end;
    6:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0005 where empl_code='''+trim(Edit1.Text)+'''');
        Active:=True;
      end;
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.user_ptr='+IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    end;
    7:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0005 where empl_code='''+trim(Edit1.Text)+'''');
        Active:=True;
      end;
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.confi_userptr='+IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    end;
    8:
    begin
      SGrd1.Cells[1,sgrid_row]:=Trim(Edit1.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0005 where empl_code='''+trim(Edit1.Text)+'''');
        Active:=True;
      end;
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.install_userptr='+IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    end;
    9:
    begin
      SGrd1.Cells[1,sgrid_row]:=Label1.Caption+DateTimeToStr(dtpk1.Date)+Label3.Caption+DateTimeToStr(dtpk2.Date);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.purch_date>='+quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk1.Date))+
                                ' and Data0417.purch_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk2.Date+1));
    end;
    10:
    begin
      SGrd1.Cells[1,sgrid_row]:=Label1.Caption+DateTimeToStr(dtpk1.Date)+Label3.Caption+DateTimeToStr(dtpk2.Date);
      SGrd1.Cells[2,sgrid_row]:=' and Data0417.user_date>='+quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk1.Date))+
                                ' and Data0417.user_date<= '+quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk2.Date+1));
    end;
  end;
end;

procedure TFrm_Search.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_Search.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Search.BitBtn1Click(Sender: TObject);
begin
  Frm_employee:=TFrm_employee.Create(Application);
  with Frm_employee.ADO05 do
  begin
    Close;
    Parameters[0].Value:='';
    if Trim(Edit1.Text)<>'' then
      Parameters[0].Value:=Trim(Edit1.Text)
    else
      Parameters[0].Value:='';
    Open;
    if IsEmpty then
    begin
      ShowMessage('请输入正确的员工工号');
      Edit1.SetFocus;
      Exit;
    end;
  end;
  if Frm_employee.ShowModal=mrok then
  begin
    Edit1.Text:=Frm_employee.ADO05empl_code.Value;
    Button1.Enabled:=True;
  end;
end;

procedure TFrm_Search.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Button1.Enabled:=True;
end;

procedure TFrm_Search.N1Click(Sender: TObject);
var
  i:Byte;
begin
  if SGrd1.RowCount>2 then
  begin
    for i:=SGrd1.Row to SGrd1.RowCount-2 do
      SGrd1.Rows[i].Text:=SGrd1.Rows[i+1].Text;
    SGrd1.RowCount:=SGrd1.RowCount-1;
  end
  else SGrd1.Rows[SGrd1.Row].Clear;
end;

end.
