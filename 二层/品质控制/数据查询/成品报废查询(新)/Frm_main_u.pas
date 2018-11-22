unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TFrm_main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    ADOCon: TADOConnection;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    tmp: TADOQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

   procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

uses common,MyClass,Frm_detail_u,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(ADOCon) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
    exit;
  end;
  caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  {user_ptr:='3';
  rkey73:='3';
  vprev:='3';
  ADOCon.Open;
  }
  
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=getsystem_date(tmp,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
  ListBox3.ItemIndex:=0;
   MyDataClass :=TMyDataClass.Create(adocon); 
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  RadioButton1.Checked:=true;
 // RadioButton4.Visible:=listbox3.ItemIndex<>4;
end;

procedure TFrm_main.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TFrm_main.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit3.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid_row]:=edit3.Text ;
  case listbox3.ItemIndex of
   0:Con('and data0025.manu_part_number');
   1:Con('and data0025.manu_part_desc');
   2:Con('and data0039.REJ_CODE');
   3:Con('and data0006.WORK_ORDER_NUMBER');
   4:Con('and data0015.WAREHOUSE_CODE');
   5:Con('and data0016.CODE');
  end;
end;

procedure TFrm_main.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0,1:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
                        'dbo.Data0010.CUST_CODE,'+#13+
                        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY ,'+#13+
                        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC '+#13+
                        'FROM dbo.Data0025 INNER JOIN dbo.Data0010 '+
                        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                        'order by dbo.Data0025.MANU_PART_NUMBER';
      if self.ListBox3.ItemIndex=0 then inputvar.KeyField:='MANU_PART_NUMBER' else inputvar.KeyField:='MANU_PART_DESC';
    end;

    2:
    begin
      InputVar.Fields:='REJ_CODE/缺陷代码/110,REJECT_DESCRIPTION/缺陷描叙/251';
      InputVar.Sqlstr:='SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION FROM dbo.Data0039';
      inputvar.KeyField:='REJ_CODE';
    end;
    3:
    begin
      InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/110,CUT_NO/配料单号/285';
      InputVar.Sqlstr :='SELECT RKEY, WORK_ORDER_NUMBER, CUT_NO FROM dbo.Data0006 ';
      inputvar.KeyField:='WORK_ORDER_NUMBER';
    end;
    4:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/110,ABBR_NAME/工厂简称/285';
      InputVar.Sqlstr :='SELECT  RKEY, WAREHOUSE_CODE, ABBR_NAME FROM dbo.Data0015 ';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'CODE/仓库代码/110,LOCATION/仓库名称/285';
      InputVar.Sqlstr :='SELECT RKEY, CODE, LOCATION FROM Data0016 where location_type=1';
      inputvar.KeyField:='CODE';
    end;

  end;

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     1:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     2:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['REJ_CODE']);
     3:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WORK_ORDER_NUMBER']);
     4:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
     5:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
    end;
    button3.SetFocus;
  end else edit3.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
 
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var i:integer;
    sSQL1,sSQL2:string;
    sD1,sD2:string;
    Sqlstr,Sqlstr1:string;
begin
  try
    screen.Cursor:=crSQLWait;
    for i:=1 to sgrid1.RowCount-2 do
    begin
      if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      if (sgrid1.Cells[2,i]<> '') and (sgrid1.Cells[0,i]<>'原因')  then Sqlstr1:=sqlstr1+sgrid1.Cells[2,i];
    end;
    sD1:=formatdatetime('YYYY-MM-DD',dtpk1.Date)+' '+formatdatetime('hh:nn:ss',dtt1.Time);
    sD2:=formatdatetime('YYYY-MM-DD',dtpk2.Date)+' '+formatdatetime('hh:nn:ss',dtt2.Time);

    sSQL1:=' SELECT Data0025.MANU_PART_NUMBER,'
                         +' Data0025.MANU_PART_DESC, '
                         +' Data0058.TDATETIME,'
                         +' Data0058.QTY_REJECT,'
                         +' Data0005.EMPLOYEE_NAME, Data0039.REJ_CODE,'
                         +' Data0039.REJECT_DESCRIPTION, Data0034.DEPT_CODE,'
                         +' Data0034.DEPT_NAME,''报废'' as ttype2,Data0006.WORK_ORDER_NUMBER,'
                         +' data0025.unit_sq,cast(data0025.unit_sq*Data0058.QTY_REJECT as numeric(15,4)) MJ,'
                         +' data0016.code,data0016.location,data0015.WAREHOUSE_CODE,data0058.rkey,Data0053.MFG_DATE,'
                         +' data0058.REFERENCE AS REFERENCE'
                         +' FROM Data0058 INNER JOIN'
                               +' Data0005 ON Data0058.EMPL_PTR = Data0005.RKEY INNER JOIN'
                               +' Data0053 ON Data0058.TRAN_PTR = Data0053.RKEY INNER JOIN'
                               +' Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY INNER JOIN'
                               +' Data0025 ON Data0053.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
                               +' Data0034 ON'
                               +' Data0058.RESP_DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN'
                               +' Data0006 ON Data0058.WO_PTR = Data0006.RKEY inner join'
                               +' Data0016 ON Data0053.LOC_PTR = Data0016.RKEY inner join'
                               +' data0015 on data0058.warehouse_ptr=data0015.rkey'
                   +' WHERE (Data0058.TTYPE = 2) AND (Data0058.TDATETIME >='''+sD1+''') AND'
                   +' (Data0058.TDATETIME < '''+sD2+''') '+Sqlstr ;

   // Sqlstr:=StringReplace(Sqlstr, 'data0039.REJ_CODE', NewPattern: string; rfIgnoreCase);
    
    sSQL2:='SELECT Data0025.MANU_PART_NUMBER,'
                         +' Data0025.MANU_PART_DESC, '
                         +' Data0113.TDATE AS TDATETIME, Data0113.QUANTITY AS QTY_REJECT,'
                         +' Data0005.EMPLOYEE_NAME,''盘点'' as REJ_CODE,''盘点'' as REJECT_DESCRIPTION ,'
                         +' ''盘点'' as DEPT_CODE,'
                         +' ''盘点'' as DEPT_NAME,''盘点'' as ttype2,Data0006.WORK_ORDER_NUMBER as WORK_ORDER_NUMBER'
                         +' ,data0025.unit_sq,cast(data0025.unit_sq*Data0113.QUANTITY as numeric(15,4)) MJ,'
                         +' data0016.code,data0016.location,data0015.WAREHOUSE_CODE,data0113.rkey,Data0053.MFG_DATE,'
                         +' DATA0113.REFERENCE_NUMBER AS REFERENCE'
                   +' FROM Data0113 INNER JOIN'
                         +' Data0053 ON Data0113.DEST_PTR = Data0053.RKEY INNER JOIN'
                         +' Data0025 ON Data0053.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
                         +' Data0005 ON Data0113.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN'
                         +' Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY inner join'
                         +' Data0016 ON Data0053.LOC_PTR = Data0016.RKEY inner join'
                         +' data0015 on data0053.whse_ptr=data0015.rkey'
                   +' WHERE (Data0113.TRAN_TYPE = 3) AND (Data0113.TDATE >= '''+sD1+''') AND '
                   +' (Data0113.TDATE < '''+sD2+''') '+Sqlstr1 ;

    case radiogroup1.ItemIndex of
      0: sSQL1:=sSQL1+' union all  '+sSQL2;
      2: sSQL1:=sSQL2;
    end;

    Frm_detail:=TFrm_detail.Create(nil);
    Frm_detail.ADO58.Connection:=ADOCon;
    Frm_detail.ADO58.SQL.Text:=sSQL1;
    frm_detail.ADO58.Prepared;
    Frm_detail.ADO58.Open;
    screen.Cursor:=crdefault;
    Frm_detail.ShowModal;
 finally
    Frm_detail.Free;
 end;
end;

procedure TFrm_main.FormDestroy(Sender: TObject);
begin
MyDataClass.Free;
end;

end.
