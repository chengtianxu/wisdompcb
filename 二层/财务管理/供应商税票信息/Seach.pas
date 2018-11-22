unit Seach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ComCtrls, Menus;

type
  TForm_Seach = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SGrid: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    btnInsert: TButton;
    Panel1: TPanel;
    btnEnter: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    Chk: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    procedure ListBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Update_Sgrid(Sgrd_row: Byte);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Seach: TForm_Seach;
  sql: string;

implementation

uses Provider, Supplier, dmo;


{$R *.dfm}

procedure TForm_Seach.ListBox1Click(Sender: TObject);
begin
  Label1.Visible:=True;
  Label1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  Edit1.Visible:=True;
  Edit1.Text:='';
  BitBtn1.Visible:=False;
  Chk.Visible:=False;
  btnInsert.Enabled:=False;
  case ListBox1.ItemIndex of
    0:;
    1:;
    2:
     BitBtn1.Visible:=True;
    3:;
    4:;
  else
     Label1.Visible:=False;
     Edit1.Visible:=False;
     Chk.Visible:=True;
     btnInsert.Enabled:=True;
  end;
end;

procedure TForm_Seach.FormActivate(Sender: TObject);
begin
  SGrid.Cells[0,0]:='条件名称';
  SGrid.Cells[1,0]:='条件值';
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
  sql:= 'SELECT Data0127.rkey,DATA0127.invoice_number,DATA0127.invoice_no,DATA0127.supp_ptr,Data0023.CODE,Data0023.SUPPLIER_NAME,'+#13+
       'Data0023.ANALYSIS_CODE1,DATA0127.invoice_date,DATA0127.account_date,DATA0127.matl_year,DATA0127.matl_month,'+#13+
       'DATA0127.MATL_amount,DATA0127.tax_amount,DATA0127.tax,DATA0127.INV_TOTAL,DATA0127.remark,'+#13+
       'DATA0127.GL_HEADER_PTR,Data0105.VOUCHER,DATA0127.GLPTR_STATUS,Data0127.user_ptr,Data0005.employee_name,'+#13+
       'Data0127.goods_name,Data0127.tax_number,'+#13+
       'Data0127.total_matl_amount,Data0127.total_tax_amount,Data0127.pause_matl_amount,Data0127.pause_tax_amount,'+#13+
       'CASE DATA0127.GLPTR_STATUS WHEN 0 THEN ''否'' WHEN 1 THEN ''是'' END AS GLPTR_STATUS1,Data0015.warehouse_code,'+#13+
       'Data0015.warehouse_name,Data0015.abbr_name,Data0127.ent_date,Data0127.warehouse_ptr'+#13+
       'FROM   DATA0127 INNER JOIN'+#13+
       'Data0005 ON Data0127.user_ptr=Data0005.rkey INNER JOIN'+#13+
       'Data0023 ON DATA0127.supp_ptr = Data0023.RKEY LEFT JOIN'+#13+
       'Data0105 ON DATA0127.GL_HEADER_PTR = Data0105.RKEY LEFT JOIN'+#13+
       'Data0015 ON Data0127.warehouse_ptr=Data0015.RKEY'+#13+
       'WHERE 1=1 and DATA0127.invoice_date between :dtpk1 and :dtpk2 ';
end;

procedure TForm_Seach.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Seach.BitBtn1Click(Sender: TObject);
begin
  try
    Form_Supplier:=TForm_Supplier.Create(Application);
    Form_Supplier.ADO23.Close;
    if Trim(Edit1.Text)<>'' then
      Form_Supplier.ADO23.Parameters[0].Value:=Trim(Edit1.Text)
    else
      Form_Supplier.ADO23.Parameters[0].Value:='';
    Form_Supplier.ADO23.Open;
    if Form_Supplier.ADO23.IsEmpty then
    begin
      MessageDlg('请输入正确的供应商代码!',mtInformation,[mbOK],0);
      Edit1.SetFocus;
    end
    else
    begin
      if Form_Supplier.ShowModal=mrok then
      begin
        Edit1.Text:=Form_Supplier.ADO23CODE.Value;
        Edit1.Font.Color:=clWindowText;
      end;
    end;
  finally
    Form_Supplier.Free;
  end;
end;

procedure TForm_Seach.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    btnInsert.Enabled:=True
  else
    btnInsert.Enabled:=False;
end;

procedure TForm_Seach.Update_Sgrid(Sgrd_row: Byte);
begin
  SGrid.Cells[0,Sgrd_row]:=ListBox1.Items[ListBox1.ItemIndex];
  SGrid.Cells[1,Sgrd_row]:=Trim(Edit1.Text);
  Form_Supplier:=TForm_Supplier.Create(Application);
  case ListBox1.ItemIndex of
    0:
      SGrid.Cells[2,Sgrd_row]:=' and Data0127.invoice_number like ''%'+trim(Edit1.Text)+'%''';
    1:
    begin
      SGrid.Cells[2,Sgrd_row]:=' and Data0127.invoice_no like ''%'+trim(Edit1.Text)+'%''';
    end;
    2:
    begin
      Form_Supplier.ADO23.Close;
      Form_Supplier.ADO23.Parameters[0].Value:=Trim(Edit1.Text);
      Form_Supplier.ADO23.Open;
      SGrid.Cells[2,Sgrd_row]:=' and Data0127.supp_ptr='+Form_Supplier.ADO23RKEY.Text;
    end;
    3:
      SGrid.Cells[2,Sgrd_row]:=' and Data0127.matl_year='+trim(Edit1.Text);
    4:
      SGrid.Cells[2,Sgrd_row]:=' and Data0127.matl_month='+trim(Edit1.Text);
    else
    begin
      if Chk.Checked then
      begin
        SGrid.Cells[2,Sgrd_row]:=' and Data0127.glptr_status='+inttostr(1);
        SGrid.Cells[1,Sgrd_row]:='是';
      end
      else
      begin
        SGrid.Cells[2,Sgrd_row]:=' and Data0127.glptr_status='+inttostr(0);
        SGrid.Cells[1,Sgrd_row]:='否';
      end;
    end;
  end;
end;

procedure TForm_Seach.btnInsertClick(Sender: TObject);
var
  i:Byte;
begin
  for i := 1 to SGrid.RowCount-2 do
  begin
    if SGrid.Cells[0,i]=ListBox1.Items[ListBox1.ItemIndex] then
    begin
      Update_Sgrid(i);
      Exit;
    end;
  end;
  Update_Sgrid(SGrid.RowCount-1);
  SGrid.RowCount:=SGrid.RowCount+1;
end;

procedure TForm_Seach.btnEnterClick(Sender: TObject);
begin
  DM.ADO127.Active:= False;
  DM.ADO127.CommandText:=sql;
  ModalResult:=mrOk;
end;

procedure TForm_Seach.N1Click(Sender: TObject);
var
  i:Byte;
begin
  if SGrid.RowCount>2 then
  begin
    for i := SGrid.Row to SGrid.RowCount-2 do
    begin
      SGrid.Rows[i]:=SGrid.Rows[i+1];
      SGrid.RowCount:=SGrid.RowCount-1;
    end
  end
  else
    SGrid.Rows[SGrid.Row].Clear;
end;
procedure TForm_Seach.ComboBox1Change(Sender: TObject);
begin
  sql:= 'SELECT Data0127.rkey,DATA0127.invoice_number,DATA0127.invoice_no,DATA0127.supp_ptr,Data0023.CODE,Data0023.SUPPLIER_NAME,'+#13+
       'Data0023.ANALYSIS_CODE1,DATA0127.invoice_date,DATA0127.account_date,DATA0127.matl_year,DATA0127.matl_month,'+#13+
       'DATA0127.MATL_amount,DATA0127.tax_amount,DATA0127.tax,DATA0127.INV_TOTAL,DATA0127.remark,'+#13+
       'Data0127.goods_name,Data0127.tax_number,'+#13+
       'Data0127.total_matl_amount,Data0127.total_tax_amount,Data0127.pause_matl_amount,Data0127.pause_tax_amount,'+#13+
       'DATA0127.GL_HEADER_PTR,Data0105.VOUCHER,DATA0127.GLPTR_STATUS,Data0127.user_ptr,Data0005.employee_name,'+#13+
       'CASE DATA0127.GLPTR_STATUS WHEN 0 THEN ''否'' WHEN 1 THEN ''是'' END AS GLPTR_STATUS1,Data0015.warehouse_code,'+#13+
       'Data0015.warehouse_name,Data0015.abbr_name,Data0127.ent_date,Data0127.warehouse_ptr'+#13+
       'FROM   DATA0127 INNER JOIN'+#13+
       'Data0005 ON Data0127.user_ptr=Data0005.rkey INNER JOIN'+#13+
       'Data0023 ON DATA0127.supp_ptr = Data0023.RKEY LEFT JOIN'+#13+
       'Data0105 ON DATA0127.GL_HEADER_PTR = Data0105.RKEY LEFT JOIN'+#13+
       'Data0015 ON Data0127.warehouse_ptr=Data0015.RKEY'+#13+
       'WHERE 1=1 ';
  if ComboBox1.ItemIndex=1 then
  begin
    sql:=sql+'and DATA0127.account_date between :dtpk1 and :dtpk2 '//对帐日期
  end
  else
  begin
    sql:=sql+'and DATA0127.invoice_date between :dtpk1 and :dtpk2 '//发票日期
  end;
end;

end.
