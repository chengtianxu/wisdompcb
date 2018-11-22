unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB;


type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    RadioGroup1: TRadioGroup;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    PreColumn: TColumnEh;

    Sql71_1,sql71_2,sql71_3,sSql1,sSql2 :string;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u, invt_iqc;
{$R *.dfm}

procedure TFrm_main.init;
begin
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  sSql1:=
    'SELECT dbo.Data0070.RKEY, dbo.Data0070.PO_NUMBER, dbo.Data0070.EMPLOYEE_POINTER,'+#13+
    '  dbo.Data0070.SUPP_FAC_ADD_PTR, dbo.Data0070.WAREHOUSE_POINTER, dbo.Data0070.PO_DATE,'+#13+
    '  dbo.Data0070.SUPPIER_CONTACT,dbo.Data0070.CONTACT_PHONE, dbo.Data0070.FOB, dbo.Data0070.PO_REV_NO,'+#13+
    '  dbo.Data0070.SUPPLIER_POINTER,dbo.Data0005.employee_name, dbo.Data0023.ABBR_NAME AS supName,'+#13+
    '  dbo.Data0023.CODE, dbo.Data0015.ABBR_NAME AS facName'+#13+
    'FROM  dbo.Data0070 INNER JOIN'+#13+
    '      dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Data0005.RKEY INNER JOIN'+#13+
    '      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'+#13+
    '      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY'+#13+
    'where (data0070.po_type=''S'') and (data0070.status=5) and'+#13+
    '       data0070.rkey in (select po_ptr from data0071 where'+#13+
    '(dbo.Data0071.avl_flag = ''Y'') OR'+#13+
    '((dbo.Data0071.IQCEMPL_PTR IS NOT NULL) AND'+#13+
    '(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_IN_INSP > 0)) group by po_ptr)';      //待检

  sSql2:=
      'SELECT dbo.Data0070.RKEY, dbo.Data0070.PO_NUMBER, dbo.Data0070.EMPLOYEE_POINTER,'+#13+
    '  dbo.Data0070.SUPP_FAC_ADD_PTR, dbo.Data0070.WAREHOUSE_POINTER, dbo.Data0070.PO_DATE,'+#13+
    '  dbo.Data0070.SUPPIER_CONTACT,dbo.Data0070.CONTACT_PHONE, dbo.Data0070.FOB, dbo.Data0070.PO_REV_NO,'+#13+
    '  dbo.Data0070.SUPPLIER_POINTER,dbo.Data0005.employee_name, dbo.Data0023.ABBR_NAME AS supName,'+#13+
    '  dbo.Data0023.CODE, dbo.Data0015.ABBR_NAME AS facName'+#13+
    'FROM  dbo.Data0070 INNER JOIN'+#13+
    '      dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo.Data0005.RKEY INNER JOIN'+#13+
    '      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'+#13+
    '      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY'+#13+
        'where (data0070.po_type=''S'') and (data0070.status=5) and '+#13+
        'data0070.rkey in (select po_ptr from data0071 '+ #13+
        'where (dbo.Data0071.QUAN_IN_INSP > 0) AND (dbo.Data0071.QUAN_RECD < dbo.Data0071.QUAN_IN_INSP)'+#13+
        'group by po_ptr)' ;
                                    //已有检查数量，且入库数量小于已检数量
  sql71_3:=
    'SELECT     dbo.Data0071.RKEY, dbo.Data0071.PO_PTR, dbo.Data0071.INVT_PTR,'+#13+
    ' dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV_NAME, data0017.INV_DESCRIPTION,'+#13+
    ' dbo.Data0071.QUAN_ORD,  data0071.QUAN_IN_INSP,data0071.QUAN_RECD,'+#13+
    'dbo.Data0071.REQ_DATE, dbo.Data0071.extra_req, dbo.Data0071.avl_flag,dbo.Data0071.IF_CAF,'+#13+
    'dbo.Data0071.rohs, dbo.Data0002.UNIT_NAME, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0071.PRINTED_DATE,'+#13+
    'CASE data0017.CRITICAL_MATL_FLAG WHEN 0 THEN ''否'' WHEN 1 THEN ''是'' END AS CRITICAL_MATL '+#13+
    'FROM         dbo.Data0071 INNER JOIN '+#13+
    'dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
    'dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN '+#13+
    'dbo.Data0005 ON dbo.Data0071.IQCEMPL_PTR = dbo.Data0005.RKEY'+#13;

  Sql71_1:=
'WHERE    ( (dbo.Data0071.avl_flag = ''Y'') OR'+#13+
' ( (dbo.Data0071.IQCEMPL_PTR IS NOT NULL) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_IN_INSP > 0)))'+#13+
'and (data0071.po_ptr=:RKEY)';

 sql71_2:=
' WHERE  (dbo.Data0071.QUAN_IN_INSP > 0) AND (dbo.Data0071.QUAN_RECD < dbo.Data0071.QUAN_IN_INSP)'+#13+
'and (data0071.po_ptr=:RKEY)';       //采购明细中的接收数量少于已检查数量

  DM.AQ70.Open;   //默认待检
  dm.AQ71.Open;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;


 // dm.ADOCon.Open;
 { rkey73:='1';
  user_ptr := '3';
  vprev := '4';
  }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if PreColumn.Field.FieldKind = fkCalculated then  exit;

//  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
//  begin
    if trim(Edit1.text) <> '' then
    begin
      //if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DM.AQ70.Filter:=PreColumn.FieldName + ' like ''%' + trim(edit1.text) + '%'''
      //else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
       // DM.AQ70.Filter:=field_name+' >= ' + inttostr(strtointdef(edit1.text,0));
    end else
      DM.AQ70.Filter:='';
//  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.AQ70.IsEmpty then exit;
  i := DM.AQ70rkey.AsInteger ;
  DM.AQ70.Close;
  DM.AQ70.Open;
  DM.AQ70.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AQ70.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AQ70.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName <> column.FieldName) and not (column.Field is TDateTimeField) then
  begin
    label1.Caption := column.Title.Caption ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else 
    edit1.SetFocus;
end;


procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    s,Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];

    if RadioGroup1.ItemIndex=0 then
      s:=sSql1
    else
     if RadioGroup1.ItemIndex=1 then
      s:=sSql2;

    dm.AQ70.SQL.Text:=s+' and (data0070.po_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''') and (data0070.po_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''')'+Sqlstr;
    dm.AQ70.Close;
    dm.AQ70.Prepared;
    dm.AQ70.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AQ70.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var
 rkey71:Integer;
begin
  if (vprev='1') or (vprev='3') then
  begin
    showmessage('您没有权限进行来料检查操作...');
    exit;
  end;

  DM.tmp.Close;
  if self.ActiveControl=Grd1 then
   begin
    DM.tmp.SQL.Text:='update data0071 set avl_flag=''N'','+
    'printed_date=getdate(),iqcempl_ptr='+user_ptr+
    ',QUAN_IN_INSP=QUAN_ORD'+
    ' where po_ptr='+DM.AQ70RKEY.AsString+
    'and dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_IN_INSP > 0';
      if DM.tmp.ExecSQL>0 then
       ShowMsg('操作成功',1);
   end
  else
   try
    Form_invt_iqc:=tForm_invt_iqc.Create(Application);
    Form_invt_iqc.Edit1.Text:=FloatToStr(DM.AQ71QUAN_ORD.Value-dm.AQ71QUAN_IN_INSP.Value);
    if Form_invt_iqc.ShowModal=mrok then
     begin
      DM.tmp.SQL.Text:='update data0071 set avl_flag=''N'','+
      'printed_date=getdate(),iqcempl_ptr='+user_ptr+',QUAN_IN_INSP=QUAN_IN_INSP+'+Form_invt_iqc.Edit1.Text+
      ' where rkey='+DM.AQ71RKEY.AsString;
      if DM.tmp.ExecSQL>0 then
       ShowMsg('操作成功',1);
     end;
   finally
     Form_invt_iqc.Free;
   end;

  rkey71:=dm.AQ71RKEY.Value;
  BtBrushClick(Sender);
  DM.AQ71.Close;
  DM.AQ71.Open;
  dm.AQ71.Locate('rkey',rkey71,[]);
end;

procedure TFrm_main.RadioGroup1Click(Sender: TObject);
begin
  DM.AQ70.Close;
  dm.AQ71.Close;
  if RadioGroup1.ItemIndex=0 then
   begin
    DM.AQ70.SQL.Text:=sSql1;
    dm.AQ71.SQL.Text:=self.sql71_3+self.Sql71_1;
   end
  else
   if RadioGroup1.ItemIndex=1 then
    begin
     DM.AQ70.SQL.Text:=sSql2;
     dm.AQ71.SQL.Text:=self.sql71_3+self.Sql71_2;
    end;
  dm.AQ70.Prepared;
  DM.AQ70.Open;
  dm.AQ71.Open;
end;

procedure TFrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AQ71.SQL.Text);
end;

procedure TFrm_main.Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.AQ71CRITICAL_MATL.Value='是' then
  Grd2.Canvas.Font.Color := clRed;

  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
 begin
  N3.Visible:=false;
  n1.Visible:=true;
  if self.ActiveControl=Grd1 then
   n1.Caption:='全部检查通过'
  else
   n1.Caption:='单项检查';
 end
else
 begin
  if self.ActiveControl=Grd1 then
   N3.Visible:=false
  else
   N3.Visible:=true;
  N1.Visible:=False;
 end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
var
  rkey71:integer;
begin
  if (vprev='1') or (vprev='3') then
  begin
    showmessage('您没有权限进行来料检查操作...');
    exit;
  end;

  dm.tmp.Close;
  dm.tmp.SQL.Text:='select rkey,QUAN_IN_INSP,QUAN_RECD from data0071 where rkey='+DM.AQ71RKEY.AsString+
  ' and round(QUAN_IN_INSP,5)='+dm.AQ71QUAN_IN_INSP.AsString+
  ' and round(QUAN_RECD,5)='+dm.AQ71QUAN_RECD.AsString;  
  dm.tmp.Open;
if dm.tmp.IsEmpty then
 ShowMsg('检查数量、入库数量发现变化，可能多人同时操作,失败！',1)
else
 begin
   dm.ADOCon.BeginTrans;
  try
    dm.tmp.Close;
    dm.tmp.SQL.Text:='update data0071 '+
                'set QUAN_IN_INSP=QUAN_RECD'+
                ' where rkey='+DM.AQ71RKEY.AsString;
    dm.tmp.ExecSQL;

    dm.tmp.Close;
    dm.tmp.SQL.Text:='update data0071 '+
                'set IQCEMPL_PTR=null,avl_flag=''Y'',PRINTED_DATE=null'+
                ' where rkey='+DM.AQ71RKEY.AsString+
                ' and QUAN_IN_INSP=0';
    dm.tmp.ExecSQL;
    dm.ADOCon.CommitTrans;
    ShowMsg('撤销操作成功！',1);
    rkey71:=dm.AQ71RKEY.Value;
    BtBrushClick(Sender);
    DM.AQ71.Close;
    DM.AQ71.Open;
    dm.AQ71.Locate('rkey',rkey71,[]);
  except
   on E: Exception do
    begin
     dm.ADOCon.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;

end;

end.
