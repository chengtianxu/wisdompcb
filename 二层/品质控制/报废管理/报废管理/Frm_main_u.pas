unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh, ComCtrls;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BtBrush: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu2: TPopupMenu;
    DS1: TDataSource;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    DBGridEh1: TDBGridEh;
    Edt: TMenuItem;
    Del: TMenuItem;
    Look: TMenuItem;
    Audit: TMenuItem;
    N1: TMenuItem;
    UnAudit: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure EdtClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LookClick(Sender: TObject);
    procedure AuditClick(Sender: TObject);
    procedure UnAuditClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    ADOQALL2sql :string;
    Vdtpk3Time : tTime;
    Vdtpk4Time :tTime;
    procedure item_click(sender:TObject);
    function CheckPD2:boolean;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
uses
   common, DM_u ,Frm_edt_u,IF_Unit1 ;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOCon) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  user_ptrCaption := user_ptr;
  vprevCaption := vprev;


 // user_ptrCaption := '785';
  //vprevCaption := '4';
  //DM.ADOCon.Open;

  DM.getdt;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  ADOQALL2sql := '' ;
  init;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Active then
   if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
      Export_dbGridEH_to_Excel(DBGridEh1,'生产报废') ;
end;

procedure TFrm_main.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
  sSort:string;
begin
  i := -1 ;
  sSort:=dm.ADOQAll2.Sort;
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if not DBGridEh1.DataSource.DataSet.IsEmpty then
        i := DBGridEh1.DataSource.DataSet.FieldValues['RKEY'] ;
    DBGridEh1.DataSource.DataSet.Close ;
  end;

  DBGridEh1.DataSource.DataSet.Open ;
  dm.ADOQAll2.Sort:=sSort;
  if i <> -1 then DBGridEh1.DataSource.DataSet.Locate('RKEY',i,[]);
end;

procedure TFrm_main.init;
var
  i:integer;
  item:TMenuItem;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  Label1.Caption := DBGridEh1.Columns[0].Title.Caption ;
  PreColumn := DBGridEh1.Columns[0];

  for i := 0 to DBGridEh1.Columns.Count-1 do
  begin
    item := TmenuItem.Create(self);
    item.Caption := DBGridEh1.Columns[i].Title.Caption;
    item.Checked := DBGridEh1.Columns[i].Visible;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;
  if ADOQALL2sql = '' then ADOQALL2sql := dm.ADOQALL2.SQL.Text ;
  Vdtpk3Time := StrToTime('00:00:00');
  dm.ADOQALL2.Parameters.ParamValues['vdate1']:=FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
  Vdtpk4Time := StrToTime('23:59:59');
  dm.ADOQALL2.Parameters.ParamValues['vdate2']:=FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
  dm.ADOQALL2.Prepared ;
  dm.ADOQALL2.Open ;
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind=fkCalculated then exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    DBGridEh1.DataSource.DataSet.Filter := '';
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        if DBGridEh1.DataSource.DataSet.Filter <> '' then
           DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
        else
           DBGridEh1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
      end else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        if DBGridEh1.DataSource.DataSet.Filter <> '' then
           DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
        else
           DBGridEh1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
      end;
    end ;
  end;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
var
  i :integer;
   sqlstr:string;
begin
  If_Form1:= TIf_Form1.Create(application) ;
  try
    If_Form1.DateTimePicker1.Date := Vdtpk3Date ;
    If_Form1.DateTimePicker2.Date := Vdtpk4Date ;
    If_Form1.DateTimePicker3.Time := Vdtpk3Time ;
    If_Form1.DateTimePicker4.Time := Vdtpk4Time ;
    if If_Form1.ShowModal=mrok then
    begin
      screen.Cursor:=crSQLWait;
      Vdtpk3Date := If_Form1.DateTimePicker1.Date;
      Vdtpk4Date := If_Form1.DateTimePicker2.Date ;
      Vdtpk3Time := If_Form1.DateTimePicker3.Time ;
      Vdtpk4Time := If_Form1.DateTimePicker4.Time;
      if dm.ADOQALL2.Active then dm.ADOQALL2.Close ;
      dm.ADOQALL2.SQL.Clear ;
      dm.ADOQALL2.SQL.Add(ADOQALL2SQL);
      for i := 1 to If_Form1.sgrid1.RowCount - 2  do
        if If_Form1.sgrid1.Cells[2,i]<> '' then  Sqlstr:=sqlstr+If_Form1.sgrid1.Cells[2,i];
      dm.ADOQALL2.SQL.Add(Sqlstr);
      dm.ADOQALL2.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
      Dm.ADOQALL2.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
      dm.ADOQALL2.Prepared ;
      dm.ADOQALL2.Open ;
    end ;
  finally
    screen.Cursor:=crDefault;
    If_Form1.Free ;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  Add.Enabled := (vprevCaption = '2') or (vprevCaption = '4') ;
  Audit.Enabled :=(vprevCaption = '4') and not DBGridEh1.DataSource.DataSet.IsEmpty and (dm.ADOQALL2.fieldbyname('qty_reject').AsInteger=0);
  UnAudit.Enabled :=(vprevCaption = '4') and not DBGridEh1.DataSource.DataSet.IsEmpty and (dm.ADOQALL2.fieldbyname('qty_reject').AsInteger>0);
                                                                                                       //报废批准
  Del.Enabled :=Add.Enabled and not DBGridEh1.DataSource.DataSet.IsEmpty and (dm.ADOQALL2.fieldbyname('qty_reject').AsInteger=0) ;
  Edt.Enabled :=Del.Enabled;
  Look.Enabled :=not DBGridEh1.DataSource.DataSet.IsEmpty;
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if dm.ADOQALL2QTY_REJECT.AsInteger<=0  then
    DBGridEh1.Canvas.Font.Color := clred ;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGridEh1.DataSource.DataSet as TADOQuery).SQL.Text)
  else if (key = 46) and (ssCtrl in shift) then
      abort;
end;

procedure TFrm_main.AddClick(Sender: TObject);
var sSort:string;
begin
 { if (vprevCaption = '1') or (vprevCaption = '3') then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;}
  if CheckPD2 then
  begin
    showmessage('在盘点中不能操作!');
    exit;
  end;

  with TFrm_Edt.Create(application) do
  try
    EditMode := 0 ;
    qty_org_rej := 0;
    pnl_org_rej := 0;
    ShowModal;
    if smrb_no='' then
      BtBrushClick(sender)
    else begin
      sSort:=dm.ADOQAll2.Sort;
      DBGridEh1.DataSource.DataSet.Close ;
      DBGridEh1.DataSource.DataSet.Open ;
      dm.ADOQAll2.Sort:=sSort;
      DBGridEh1.DataSource.DataSet.Locate('MRB_NO',smrb_no,[]);
    end;

  finally
    Free ;
  end;
end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
var
  i:integer;
begin
  if DBGridEh1.DataSource.DataSet.Active and not DBGridEh1.DataSource.DataSet.IsEmpty then
  begin
    i := DBGridEh1.DataSource.DataSet.FieldValues['RKEY'] ;
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
    if column.Title.SortMarker =smDownEh then
    begin
      column.Title.SortMarker:=smUpEh;
      dm.ADOQAll2.Sort:=Column.FieldName;
    end
   else
    begin
      column.Title.SortMarker:=smDownEh;
      dm.ADOQAll2.Sort:=Column.FieldName+' DESC';
    end;

    if field_name <> column.FieldName then
    begin
      label1.Caption := column.Title.Caption ;
      field_name := column.FieldName ;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
      Edit1Change(Edit1);
    end else
      edit1.SetFocus;
    DBGridEh1.DataSource.DataSet.Locate('RKEY',i,[]);
  end;
end;

procedure TFrm_main.EdtClick(Sender: TObject);
begin
  if CheckPD2 then
  begin
    showmessage('在盘点中不能操作!');
    exit;
  end;
  with TFrm_edt.Create(application) do
  try
    Edit1.Enabled:=false;
    Edit2.Enabled:=false;
    BtWorkNo.Enabled:=false;
    EditMode:=1 ;
    dm.adoq0058.Close ;
    dm.adoq0058.Parameters.ParamValues['rkey0058']:=DM.ADOQAll2rkey.Value;
    dm.adoq0058.Prepared ;
    dm.adoq0058.Open ;
    if dm.adoq0058.IsEmpty then
    begin
      showmessage('此记录已被其他人员删除!');
      BtBrushClick(sender);
    end else if (dm.adoq0058.fieldbyname('QTY_ORG_REJ').AsInteger<>dm.ADOQALL2QTY_ORG_REJ.AsInteger) or
                (dm.adoq0058.fieldbyname('PANELS').AsInteger<>dm.ADOQALL2PANELS.AsInteger) then
    begin
      showmessage('此记录已被其他人员修改,请检查!');
      BtBrushClick(sender);
    end else
     if ShowModal = mrok then BtBrushClick(sender);
  finally
    Free ;
  end;
end;

procedure TFrm_main.DelClick(Sender: TObject);
begin
  if CheckPD2 then
  begin
    showmessage('在盘点中不能操作!');
    exit;
  end;

  dm.adoq0058.Close ;
  dm.adoq0058.Parameters.ParamValues['rkey0058']:=dm.ADOQALL2RKEY.AsInteger ;
  dm.adoq0058.Open ;
  if dm.adoq0058.IsEmpty then
  begin
    showmessage('此记录已被其他人员删除!');
    BtBrushClick(sender);
    exit;
  end;
  if dm.adoq0058.fieldbyname('qty_reject').AsInteger = 0 then
  begin
    dm.ADOQ0006.Close;
    dm.ADOQ0006.Parameters.ParamValues['rkey0006'] := dm.ADOQALL2WO_PTR.AsInteger ;
    dm.ADOQ0006.Open ;
    dm.ADOQ0006.Edit ;
    dm.ADOQ0006QUAN_ALLREJ.AsInteger:=dm.ADOQ0006QUAN_ALLREJ.AsInteger-dm.adoq0058.fieldbyname('qty_org_rej').AsInteger ;
    dm.ADOQ0006QUAN_ALLpnl.AsInteger:=dm.ADOQ0006QUAN_ALLpnl.AsInteger-dm.adoq0058.fieldbyname('PANELS').AsInteger ;
    dm.adoq0058.Delete ;
    try
      DM.ADOCon.BeginTrans;
      dm.adoq0058.UpdateBatch;
      dm.ADOQ0006.UpdateBatch;
      DM.ADOCon.CommitTrans ;
      BtBrushClick(sender);
    except
      on E: Exception do
        begin
          DM.ADOCon.RollbackTrans ;
          MessageDlg(E.Message,mtError, [mbOk], 0);
        end;
    end;
  end ;
end;

function TFrm_main.CheckPD2: boolean;
begin
  DM.Tmp.Close ;
  DM.Tmp.SQL.Text:='SELECT RKEY FROM DATA0400 WHERE STATUS = 0';
  DM.Tmp.Open ;
  RESULT :=not DM.Tmp.IsEmpty ;
  DM.Tmp.Close ;
end;

procedure TFrm_main.LookClick(Sender: TObject);
begin
  with TFrm_edt.Create(application) do
  try
    EditMode:=2;
    ShowModal;
  finally
    Free ;
  end;
end;

procedure TFrm_main.AuditClick(Sender: TObject);
begin
  if CheckPD2 then
  begin
    showmessage('在盘点中不能操作!');
    exit;
  end;
  with DM.Tmp do
  begin
    Close;
    SQL.Text:='SELECT QTY_REJECT,QTY_ORG_REJ,PANELS,step FROM Data0058 WHERE rkey ='+ dm.ADOQALL2rkey.asstring ;
    Open;
    if IsEmpty then
    begin
      showmessage('此记录已被其他人员删除');
      BtBrushClick(nil);
      exit;
    end;

    if Fields[0].AsInteger>0 then
    begin
      showmessage('此记录已被其他人员审核');
      BtBrushClick(nil);
      exit;
    end;
    if (Fields[1].AsInteger<>DM.ADOQAll2QTY_ORG_REJ.AsInteger) or (Fields[2].AsInteger<>DM.ADOQAll2PANELS.AsInteger) or
       (Fields[3].AsInteger<>DM.ADOQAll2step.AsInteger) then
    begin
      showmessage('此记录已被其他人员修改,请重新检查后审核');
      BtBrushClick(nil);
      exit;
    end;

    try
      DM.ADOCon.BeginTrans;
      Close;              //报废表
      SQL.Text:='update data0058 set qty_reject=QTY_ORG_REJ'+
                                          ',AUDIT_EMPL_PTR='+user_ptrCaption+
                                          ',AUDIT_DATETIME=getdate()'+
                                          ' where rkey='+DM.ADOQALL2RKEY.AsString;
      ExecSQL;           //配料表
      SQL.Text:='update data0492 set QTY_REJECT=QTY_REJECT+'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ',WIP_QTY=WIP_QTY-'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ' where cut_no in (SELECT CUT_NO '+
                                          'FROM Data0006 where rkey='+DM.ADOQALL2WO_PTR.AsString+')';
      ExecSQL;            //作业单
      SQL.Text:='update data0006 set QUAN_REJ=QUAN_REJ+'+DM.ADOQALL2QTY_ORG_REJ.AsString+         //已报废PCS
                                        //  ',PANELS=PANELS-'+DM.ADOQALL2PANELS.AsString+                 //投产PNLS
                                          ',QUAN_ALLREJ=QUAN_ALLREJ-'+DM.ADOQALL2QTY_ORG_REJ.AsString+  //待审报废PCS
                                          ',QUAN_ALLpnl=QUAN_ALLpnl-'+DM.ADOQALL2PANELS.AsString+  //待审报废pnl
                                          ' where rkey='+DM.ADOQALL2WO_PTR.AsString;
      ExecSQL;            //WIP
      SQL.Text:='update data0056 set QTY_BACKLOG=QTY_BACKLOG-'+DM.ADOQALL2QTY_ORG_REJ.AsString+ //在线PCS
                                          ',PANELS=PANELS-'+DM.ADOQALL2PANELS.AsString+                //在线PNLS
                                          ' where wo_ptr='+DM.ADOQALL2WO_PTR.AsString+' and QTY_BACKLOG>='+DM.ADOQALL2QTY_ORG_REJ.AsString;
      if ExecSQL=0 then
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('在线数据状态发生变更，审核失败');
        exit;
      end;


                //WIP过数
      SQL.Text:='update data0048 set QTY_PROD=QTY_PROD-'+DM.ADOQALL2QTY_ORG_REJ.AsString+      //报废前工序生产数应扣除
                                          ',QTY_REJECT=QTY_REJECT+'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ',PANELS=PANELS-'+DM.ADOQALL2PANELS.AsString+
                                          ' where wo_ptr='+DM.ADOQALL2WO_PTR.AsString+' and Data0048.STEP_NO>='+DM.ADOQALL2STEP.AsString+
                                          ' and Data0048.STEP_NO<(select step from data0056 where wo_ptr='+DM.ADOQALL2WO_PTR.AsString+')';
      ExecSQL;

      SQL.Text:='update data0006 set PROD_STATUS=9 FROM Data0006 a INNER JOIN Data0056 b ON a.RKEY=b.WO_PTR '+
                'WHERE (b.TO_BE_STOCKED=0) AND (b.QTY_BACKLOG=0) AND (a.PROD_STATUS<>9)' ;
      ExecSQL;

      SQL.Text:='delete from data0056 where data0056.to_be_stocked=0 AND qty_backlog=0';
      ExecSQL;
      DM.ADOCon.CommitTrans;
      BtBrushClick(nil);
    except
      on E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        MessageDlg(E.Message,mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TFrm_main.UnAuditClick(Sender: TObject);
var sProdStatus:string;
begin
  if CheckPD2 then
  begin
    showmessage('在盘点中不能操作!');
    exit;
  end;

  with DM.Tmp do
  begin
    Close;
    SQL.Text:='select max(tdate) as cut_date from data0444';
    Open;
    if DM.ADOQALL2AUDIT_DATETIME.AsDateTime<=fieldbyname('cut_date').AsDateTime then
    begin
      showmessage('财务已结算,不能反审核！');
      exit;
    end;
    
    Close;
    SQL.Text:='SELECT QTY_REJECT FROM Data0058 WHERE rkey ='+ dm.ADOQALL2rkey.asstring ;
    Open;
    if IsEmpty then
    begin
      showmessage('此记录已被其他人员删除');
      BtBrushClick(nil);
      exit;
    end;

    if Fields[0].AsInteger=0 then
    begin
      showmessage('此记录已被其他人员反审核');
      BtBrushClick(nil);
      exit;
    end;

    Close;
    SQL.Text:='SELECT PROD_STATUS FROM Data0006 WHERE rkey ='+ dm.ADOQALL2wo_ptr.asstring ;
    Open;
    sProdStatus:=fields[0].AsString;

    try
      DM.ADOCon.BeginTrans;
      Close;              //报废表
      SQL.Text:='update data0058 set qty_reject=0'+
                                          ',AUDIT_EMPL_PTR=0'+
                                          ',AUDIT_DATETIME=null'+
                                          ' where rkey='+DM.ADOQALL2RKEY.AsString;
      ExecSQL;
                         //配料表
      SQL.Text:='update data0492 set QTY_REJECT=QTY_REJECT-'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ',WIP_QTY=WIP_QTY+'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ' where cut_no in (SELECT CUT_NO '+
                                          'FROM Data0006 '+
                                          'where RKEY='+DM.ADOQALL2WO_PTR.AsString+')';

      ExecSQL;           //作业单
      SQL.Text:='update data0006 set QUAN_REJ=QUAN_REJ-'+DM.ADOQALL2QTY_ORG_REJ.AsString+              //已报废PCS
                                        //  ',PANELS=PANELS+'+DM.ADOQALL2PANELS.AsString+                 //待完工的PNLS
                                          ',QUAN_ALLREJ=QUAN_ALLREJ+'+DM.ADOQALL2QTY_ORG_REJ.AsString+  //待审报废PCS
                                          ',QUAN_ALLpnl=QUAN_ALLpnl+'+DM.ADOQALL2PANELS.AsString+       //待审报废pnl
                                          ' where rkey='+DM.ADOQALL2WO_PTR.AsString;
      ExecSQL;

      if sProdStatus<>'9' then
      begin                //WIP
        SQL.Text:='update data0056 set QTY_BACKLOG=QTY_BACKLOG+'+DM.ADOQALL2QTY_ORG_REJ.AsString+     //在线PCS
                                          ',PANELS=PANELS+'+DM.ADOQALL2PANELS.AsString+                //在线PNLS
                                          ' where wo_ptr='+DM.ADOQALL2WO_PTR.AsString;
        ExecSQL;
        SQL.Text:='insert into data0117(SOURCE_TYPE,SOURCE_PTR,EMPL_PTR,TDATE,ACTION,remark) '+
                  'values(2,'+dm.ADOQALL2WO_PTR.AsString+','+user_ptrCaption+',getdate()'+',8,''报废返审核修改在线数量: '+dm.ADOQALL2QTY_REJECT.AsString+''')';
        ExecSQL;
      end else begin
        SQL.Text:='insert into data0056(Dept_ptr,WO_PTR,FLOW_NO,intime,qty_backlog,employee_ptr,panels,tdate,step,TO_BE_STOCKED,LOC_PTR) '+
                                'SELECT (SELECT Data0038.DEPT_PTR FROM Data0006 INNER JOIN Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN '+
                                        'Data0038 ON Data0025.RKEY = Data0038.SOURCE_PTR '+
                                        'WHERE Data0038.STEP_NUMBER='+DM.ADOQAll2StepNow.Asstring+' AND Data0006.RKEY='+DM.ADOQALL2WO_PTR.AsString+') as Dept_ptr,'+
                                'WO_PTR, FLOW_NO, GETDATE(),QTY_ORG_REJ,'+user_ptrCaption+',PANELS,GETDATE(),STEPNow,0,warehouse_ptr '+
                                ' FROM Data0058 where rkey='+DM.ADOQALL2RKEY.AsString;
        ExecSQL;

        DM.Tmp.SQL.Text:='SELECT MAX(Data0038.STEP_NUMBER) st,Data0025.PARENT_PTR FROM Data0038 INNER JOIN '+
                  'Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY INNER JOIN '+
                  'Data0025 ON Data0038.SOURCE_PTR=Data0025.RKEY WHERE data0038.source_ptr='+DM.ADOQAll2BOM_PTR1.AsString+
                  ' and data0034.barcode_entry_flag = ''Y'' group by Data0025.PARENT_PTR' ;
        open;
        if not IsEmpty then
        begin
          if DM.Tmp.fields[0].AsInteger=DM.ADOQAll2STEPNow.AsInteger then
          begin
            if FieldByName('PARENT_PTR').IsNull then  sProdStatus:='5' else sProdStatus:='6' ;
          end else
            sProdStatus:='3';
        end;
        close;
        SQL.Text:='update data0006 set PROD_STATUS='+sProdStatus+' where rkey='+DM.ADOQALL2WO_PTR.AsString;
        ExecSQL;

        SQL.Text:='insert into data0117(SOURCE_TYPE,SOURCE_PTR,EMPL_PTR,TDATE,ACTION,remark) '+
                  'values(2,'+dm.ADOQALL2WO_PTR.AsString+','+user_ptrCaption+',getdate()'+',0,''从报废中创建: '+dm.ADOQALL2QTY_REJECT.AsString+''')';
        ExecSQL;
      end;
                      //WIP过数
      SQL.Text:='update data0048 set QTY_PROD=QTY_PROD+'+DM.ADOQALL2QTY_ORG_REJ.AsString+       //报废前工序生产数应扣除
                                          ',QTY_REJECT=QTY_REJECT-'+DM.ADOQALL2QTY_ORG_REJ.AsString+
                                          ',PANELS=PANELS+'+DM.ADOQALL2PANELS.AsString+
                                          ' where wo_ptr='+DM.ADOQALL2WO_PTR.AsString+' and Data0048.STEP_NO>='+DM.ADOQALL2STEP.AsString;
      ExecSQL;

      DM.ADOCon.CommitTrans;
      BtBrushClick(nil);
    except
      on E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        MessageDlg(E.Message,mtError, [mbOk], 0);
      end;
    end;
  end;
end;

end.
