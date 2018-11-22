unit UMain;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, DB, DBGridEh, StdCtrls, Buttons, Grids, ADODB,DateUtils;

type
  TfrmComplaintOnline = class(TForm)
    pnl1: TPanel;
    strngrd362sgrid1: TStringGrid;
    pnl2: TPanel;
    lbl_field: TLabel;
    btn_exit: TBitBtn;
    btn_refresh: TBitBtn;
    btn_export: TBitBtn;
    btn_qry: TBitBtn;
    btn5: TBitBtn;
    edt_value: TEdit;
    btn6: TBitBtn;
    eh1: TDBGridEh;
    pm2: TPopupMenu;
    ds1: TDataSource;
    pm1: TPopupMenu;
    mni_add: TMenuItem;
    mni_edit: TMenuItem;
    mni_del: TMenuItem;
    mni_view: TMenuItem;
    mni_print: TMenuItem;
    qry1: TADOQuery;
    mni_close: TMenuItem;
    qry1RKEY: TAutoIncField;
    qry1LOG_NUMBER: TStringField;
    qry1CUSTOMER_PART_PTR: TIntegerField;
    qry1CSI_USER_PTR: TIntegerField;
    qry1CUSTOMER_PTR: TIntegerField;
    qry1LOG_DATE: TDateTimeField;
    qry1SHIP_DATE: TDateTimeField;
    qry1QTY: TFloatField;
    qry1EFFECT_TP: TStringField;
    qry1ANALYSIS: TStringField;
    qry1AFTER_ACTION: TStringField;
    qry1STATUS: TSmallintField;
    qry1CLOSED_BY_PTR: TIntegerField;
    qry1CLOSED_DATE: TDateTimeField;
    qry1DEALT_BY_PTR: TIntegerField;
    qry1DEALT_DATE: TDateTimeField;
    qry1LOSS_AMT: TIntegerField;
    qry1RESULT: TStringField;
    qry1CONTENT: TStringField;
    qry1DEFECT_MAIN: TWideStringField;
    qry1CYCLES: TWideStringField;
    qry1UNIT_PTR: TIntegerField;
    qry1if_send: TBooleanField;
    qry1CType: TIntegerField;
    qry1CUST_CODE: TStringField;
    qry1CUSTOMER_NAME: TStringField;
    qry1Ssend: TStringField;
    qry1Close_EMPLOYEE_NAME: TStringField;
    qry1MANU_PART_NUMBER: TStringField;
    qry1MANU_PART_DESC: TStringField;
    qry1Dealt_EMPLOYEE_NAME: TStringField;
    qry1Ent_EMPLOYEE_NAME: TStringField;
    qry1Unit_Name: TStringField;
    qry1dept_names: TMemoField;
    qry1Mystatus: TStringField;
    mni_UnClose: TMenuItem;
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure mni_delClick(Sender: TObject);
    procedure mni_editClick(Sender: TObject);
    procedure mni_viewClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mni_closeClick(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure mni_addClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure qry1CalcFields(DataSet: TDataSet);
    procedure mni_printClick(Sender: TObject);
    procedure mni_UnCloseClick(Sender: TObject);
  private
     PreColumn: TColumnEh;
     field_name,Msql:string;
     Vdtpk3Date : tdate;
     Vdtpk4Date :tdate;
     Vdtpk3Time : tTime;
     Vdtpk4Time :tTime;
     user_ptrCaption,vprevCaption,db_ptrCaption :string;
     procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  frmComplaintOnline: TfrmComplaintOnline;

implementation
  uses common,UDM,UPrint,UEdit,Uqry;
{$R *.dfm}

procedure TfrmComplaintOnline.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmComplaintOnline.FormCreate(Sender: TObject);
begin

  user_ptr:='1';
  vprev:='4'; 

  Caption := application.Title;

  if not App_Init(dm.con1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;

  user_ptrCaption := user_ptr;
  vprevCaption := vprev;


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd' ;
  Vdtpk3Date := EncodeDate(YearOf(now()),MonthOf(now()),1);
  Vdtpk4Date := now();
  //qry1.SQL.Text := '' ;

end;

procedure TfrmComplaintOnline.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin

  field_name := eh1.Columns[0].FieldName;
  lbl_field.Caption := eh1.Columns[0].Title.Caption ;
  PreColumn := eh1.Columns[0];

  for i := 1 to eh1.Columns.Count do
  begin
      item := TmenuItem.Create(self);
      item.Caption := eh1.Columns[i - 1].Title.Caption;
      if eh1.Columns[i - 1].Visible then
          item.Checked := true;
      item.OnClick := item_click;
      self.pm2.Items.Add(item);
  end;

   Msql:=qry1.SQL.Text;
     Vdtpk3Time := StrToTime('00:00:00');
  qry1.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
  Vdtpk4Time := StrToTime('23:59:59');
  qry1.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
  qry1.Prepared ;
  qry1.Open ;
end;

procedure TfrmComplaintOnline.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to eh1.FieldCount - 1 do
              if eh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      eh1.Columns[i].Visible := true;
                      break ;
                  end;
      end
  else
      begin
          for i := 0 to eh1.FieldCount - 1 do
              if eh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      eh1.Columns[i].Visible := false;
                      break ;
                  end ;
      end;
end;

//打印
procedure TfrmComplaintOnline.btn6Click(Sender: TObject);
var
  Lfrm:TfrmPrint;
begin
  if (vprev = '1') or (vprev = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  if not qry1.Active then exit;
  if qry1.IsEmpty then exit;

  Lfrm:=TfrmPrint.Create(nil);
  try
      Lfrm.ADOQALL2.Parameters.ParamValues['rkey0101'] := 0 ;
      Lfrm.ADOQALL2.Prepared ;
      Lfrm.ADOQALL2.Open ;
      Lfrm.ADOQ0118.Parameters.ParamValues['rkey0101'] := 0 ;
      Lfrm.ADOQ0118.Prepared ;
      Lfrm.ADOQ0118.Open ;
      Lfrm.TCompanyInfo.Prepared ;
      Lfrm.TCompanyInfo.Open ;
      Lfrm.ppReport1.Reset;
      Lfrm.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'ONlinecomplaint.rtm';
      Lfrm.ppReport1.Template.LoadFromFile;
      Lfrm.ppReport1.SaveAsTemplate:=true;
      Lfrm.ppDesigner1.ShowModal ;
      //PrintForm1.ppReport1.Print;
  finally
      Lfrm.Free ;
  end;
end;

procedure TfrmComplaintOnline.mni_delClick(Sender: TObject);
 var
  Lsql:string;
begin
     if (vprev = '1') or (vprev = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
      
 if qry1.RecordCount<1  then exit;
 if qry1.fieldbyname('status').AsInteger=3 then exit;
 

  try
    DM.con1.BeginTrans;
    Lsql:='delete data0101 where rkey='+qry1.fieldbyname('rkey').asstring;
    DM.execsql(dm.qrytemp,Lsql);
    Lsql:='delete data0118 where source_ptr='+qry1.fieldbyname('rkey').asstring;
    DM.execsql(dm.qrytemp,Lsql);
    Lsql:='delete data0148 where source_ptr='+qry1.fieldbyname('rkey').asstring;
    DM.execsql(dm.qrytemp,Lsql);
    dm.con1.CommitTrans;
    btn_refreshClick(sender);
  except on e: Exception do
  begin
  ShowMessage('错误：'+e.Message);
  dm.con1.RollbackTrans;
  end;
  end;
end;

procedure TfrmComplaintOnline.mni_editClick(Sender: TObject);
var
  LFrm:TFrmEdit;
begin
 if qry1.RecordCount<1  then exit;
 if qry1.fieldbyname('status').AsInteger=3 then exit;

   if (vprev = '1') or (vprev = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
 
          if dm.ADOQ0101.Active then dm.ADOQ0101.Close ;
          dm.ADOQ0101.Parameters.ParamValues['rkey0101'] := qry1.fieldbyname('rkey').AsInteger ;
          dm.ADOQ0101.Prepared ;
          dm.ADOQ0101.Open ;
          if dm.ADOQ0118.Active then dm.ADOQ0118.Close ;
          dm.ADOQ0118.Parameters.ParamValues['rkey0101'] := qry1.fieldbyname('rkey').AsInteger ;
          dm.ADOQ0118.Prepared ;
          dm.ADOQ0118.Open ;
          if dm.ADOQ0101.fieldbyname('status').AsInteger = 0 then
              begin
                  LFrm := Tfrmedit.Create(nil) ;
                  try
                      LFrm.Frkey101:=qry1.fieldbyname('rkey').asinteger;
                      LFrm.EditMode := 1 ;
                      dm.ADO148.Close; //打开相关文档说明表
                      dm.ADO148.Parameters[0].Value:=qry1.fieldbyname('rkey').AsInteger;
                      dm.ADO148.Open;
                      while not dm.ADO148.Eof do
                      begin
                       LFrm.file_name.Add(dm.ADO148file_name.Value+';'+'1');
                       dm.ADO148.Next;
                      end;
                      dm.ADO148.First;
                      LFrm.user_ptrCaption := user_ptrCaption;
                      if LFrm.ShowModal = mrok then
                          begin
                             btn_refreshClick(sender);
                          end ;
                  finally
                      LFrm.Free ;
                  end;
              end
          else
          begin
              dm.ADOQ0101.Close ;
              showmessage('记录不能修改!');
          end;

end;

procedure TfrmComplaintOnline.mni_viewClick(Sender: TObject);
var
  LFrm:TFrmEdit;
begin
 if qry1.RecordCount<1  then exit;
   if not qry1.IsEmpty then
      begin
          if dm.ADOQ0101.Active then dm.ADOQ0101.Close ;
          dm.ADOQ0101.Parameters.ParamValues['rkey0101'] := qry1RKEY.AsInteger ;
          dm.ADOQ0101.Prepared ;
          dm.ADOQ0101.Open ;
          if dm.ADOQ0118.Active then dm.ADOQ0118.Close ;
          dm.ADOQ0118.Parameters.ParamValues['rkey0101'] := qry1RKEY.AsInteger ;
          dm.ADOQ0118.Prepared ;
          dm.ADOQ0118.Open ;
          LFrm := TFrmEdit.Create(self) ;
          try
              LFrm.DBGridEh1.ReadOnly := true ;
              LFrm.N1.Visible := false ;
              LFrm.N2.Visible := false ;
              LFrm.DBGrid4.ReadOnly := True;
              LFrm.N30.Visible := False;
              LFrm.N31.Visible := False;
              LFrm.N32.Visible := False;
              LFrm.EditMode := 2 ;
              dm.ADO148.Close; //打开相关文档说明表
              dm.ADO148.Parameters[0].Value:=qry1RKEY.AsInteger;
              dm.ADO148.Open;
              while not dm.ADO148.Eof do
              begin
               LFrm.file_name.Add(dm.ADO148file_name.Value+';'+'1');
               dm.ADO148.Next;
              end;
              dm.ADO148.First;
              LFrm.user_ptrCaption := user_ptrCaption ;
              if LFrm.ShowModal = mrok then
                  begin
                      //BitBtn3Click(sender);
                  end ;
          finally
              LFrm.Free ;
          end;
      end;
end;

procedure TfrmComplaintOnline.btn5Click(Sender: TObject);
begin
 pm2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmComplaintOnline.pm1Popup(Sender: TObject);
begin

  mni_add.Enabled:=(vprev = '4') or (vprev = '2');
  mni_edit.Enabled:=(not qry1.IsEmpty) and  ((vprev = '4') or (vprev = '2')) and (qry1.FieldByName('status').AsInteger=0);
  mni_view.Enabled:=(not qry1.IsEmpty);
  mni_del.Enabled := (not qry1.IsEmpty) and  ((vprev = '4') or (vprev = '2')) and (qry1.FieldByName('status').AsInteger=0);
  mni_print.Enabled := (not qry1.IsEmpty);
  mni_close.Enabled:=(not qry1.IsEmpty) and  (vprev = '4' ) and (qry1.FieldByName('status').AsInteger=0);
  mni_unclose.Enabled:=(not qry1.IsEmpty) and  (vprev = '4' ) and (qry1.FieldByName('status').AsInteger=1);
end;

procedure TfrmComplaintOnline.mni_closeClick(Sender: TObject);
var
  Lsql:string;
begin
  if(vprev<>'4') then exit; //没有权限

  if qry1.fieldbyname('status').AsInteger=1 then exit;

  Lsql:='update data0101 set status =1 ,CLOSED_BY_PTR='+user_ptr+' where rkey='+qry1.fieldbyname('rkey').asstring;
  try
  DM.execsql(dm.qrytemp,Lsql);
  ShowMessage('结案成功！');
  btn_refreshClick(sender);
  except on e: Exception do
  begin
  ShowMessage('错误：'+e.Message);
  end;
  end;
end;

procedure TfrmComplaintOnline.eh1TitleClick(Column: TColumnEh);
begin
  IF eh1.DataSource.DataSet.Active THEN
      begin
          if eh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then
              begin
                  exit ;
              end ;
          if field_name <> column.FieldName then
              begin
                  lbl_field.Caption := column.Title.Caption ;
                  field_name := column.FieldName ;
                  edt_value.SetFocus;
                  PreColumn.Title.Color := clBtnFace ;
                  Column.Title.Color := clred ;
                  PreColumn := column ;
                  edt_valueChange(edt_value);
              end
          else
              edt_value.SetFocus;
      end;
end;

procedure TfrmComplaintOnline.edt_valueChange(Sender: TObject);
begin
  if eh1.DataSource.DataSet.FieldByName(field_name).FieldKind <> fkCalculated then
     if eh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftMemo]  then   //, ftWord,
          begin
              eh1.DataSource.DataSet.Filter := '';
              if trim(edt_value.text) <> '' then
                  begin
                      if eh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString,ftMemo]  then
                          begin
                              if eh1.DataSource.DataSet.Filter <> '' then
                                  eh1.DataSource.DataSet.Filter := eh1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edt_value.text) + '%'''
                              else
                                  eh1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edt_value.text) + '%''' ;
                          end
                      else if eh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
                          begin
                              if eh1.DataSource.DataSet.Filter <> '' then
                                  eh1.DataSource.DataSet.Filter := eh1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))
                              else
                                  eh1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edt_value.text,0)) ;
                          end ;
                  end ;
          end;
end;

procedure TfrmComplaintOnline.btn_qryClick(Sender: TObject);
var
  i,j :integer;
  LFrm: TfrmQry;
begin
  LFrm:= TfrmQry.Create(self) ;
  try
      LFrm.DateTimePicker1.Date := Vdtpk3Date ;
      LFrm.DateTimePicker2.Date := Vdtpk4Date ;
      LFrm.DateTimePicker3.Time := Vdtpk3Time ;
      LFrm.DateTimePicker4.Time := Vdtpk4Time ;

      if LFrm.ShowModal = mrok then
          begin
              Vdtpk3Date :=  LFrm.DateTimePicker1.Date ;
              Vdtpk4Date := LFrm.DateTimePicker2.Date ;
              Vdtpk3Time := LFrm.DateTimePicker3.Time ;
              Vdtpk4Time := LFrm.DateTimePicker4.Time ;
              LFrm.sgrid1.RowCount := LFrm.sgrid1.RowCount ;
              LFrm.sgrid1.ColCount := LFrm.sgrid1.ColCount ;
              if qry1.Active then qry1.Close ;
              qry1.SQL.Clear ;
              qry1.SQL.Add(Msql);
              for i := 1 to LFrm.sgrid1.RowCount - 2  do
                  begin
                      qry1.SQL.Add(trim(LFrm.sgrid1.Cells[2,i]));
                  end;
              //showmessage(qry1.SQL.text);
              qry1.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
              qry1.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
              qry1.Prepared ;
              qry1.Open ;
          end ;
  finally
      Lfrm.Free ;
  end;
end;

procedure TfrmComplaintOnline.btn_exportClick(Sender: TObject);
begin
  IF eh1.DataSource.DataSet.Active THEN
      IF eh1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGridEH_to_Excel(eh1,'客户投诉处理') ;
end;

procedure TfrmComplaintOnline.mni_addClick(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime;
  Lfrm:Tfrmedit;
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;

  if dm.ADOQ0101.Active then dm.ADOQ0101.Close ;
  dm.ADOQ0101.Parameters.ParamValues['rkey0101'] := null ;
  dm.ADOQ0101.Prepared ;
  dm.ADOQ0101.Open ;
  if dm.ADOQ0118.Active then dm.ADOQ0118.Close ;
  dm.ADOQ0118.Parameters.ParamValues['rkey0101'] := null ;
  dm.ADOQ0118.Prepared ;
  dm.ADOQ0118.Open ;
  if dm.ADO148.Active then dm.ADO148.Close ;
  dm.ADO148.Parameters.ParamValues['rkey0101'] := null ;
  dm.ADO148.Prepared ;
  dm.ADO148.Open ;
  Lfrm := Tfrmedit.Create(nil) ;
  try
      Lfrm.DBGridEh1.ReadOnly := False ;
      Lfrm.N1.Visible := true;
      Lfrm.N2.Visible := True;
      Lfrm.EditMode := 0 ;
      Lfrm.qty_org_rej := 0;
      Lfrm.user_ptrCaption := user_ptrCaption;
      if Lfrm.ShowModal = mrok then
          begin
              btn_refreshClick(sender);
          end ;
  finally
      Lfrm.Free ;
  end;
end;

procedure TfrmComplaintOnline.btn_refreshClick(Sender: TObject);
var
  i:integer;
begin
  i := -1 ;
  IF eh1.DataSource.DataSet.Active THEN
      begin
          if not eh1.DataSource.DataSet.IsEmpty then
              i := eh1.DataSource.DataSet.FieldValues['RKEY'] ;
          eh1.DataSource.DataSet.Close ;
      end;
  eh1.DataSource.DataSet.Open ;
  if i <> -1 then eh1.DataSource.DataSet.Locate('RKEY',i,[]);
end;

procedure TfrmComplaintOnline.qry1CalcFields(DataSet: TDataSet);
begin
 case  qry1.FieldByName('status').AsInteger of
      0 : qry1.FieldByName('Mystatus').Asstring := '待提交';
      1 : qry1.FieldByName('Mystatus').Asstring := '已结案';
  end;
end;

procedure TfrmComplaintOnline.mni_printClick(Sender: TObject);
var
  Lfrm: TfrmPrint;
begin
  if not qry1.Active then exit;
  if   qry1.IsEmpty then exit;
  LFrm := TfrmPrint.Create(self) ;
  try
      LFrm.ADOQALL2.Parameters.ParamValues['rkey0101'] := qry1RKEY.AsInteger  ;
      LFrm.ADOQALL2.Prepared ;
      LFrm.ADOQALL2.Open ;
      LFrm.ADOQ0118.Parameters.ParamValues['rkey0101'] := qry1RKEY.AsInteger  ;
      LFrm.ADOQ0118.Prepared ;
      LFrm.ADOQ0118.Open ;
      LFrm.TCompanyInfo.Prepared ;
      LFrm.TCompanyInfo.Open ;
      LFrm.ppReport1.Reset;
      LFrm.ppReport1.Template.FileName :=
      StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'ONlinecomplaint.rtm';
       //ShowMessage(LFrm.ppReport1.Template.FileName);
      LFrm.ppReport1.Template.LoadFromFile;
      LFrm.ppReport1.SaveAsTemplate:=false;
      LFrm.ppReport1.OutlineSettings.Enabled:=False;
      LFrm.ppReport1.Print;
  finally
      LFrm.Free ;
  end;
end;

procedure TfrmComplaintOnline.mni_UnCloseClick(Sender: TObject);
var
  Lsql:string;
begin
  if(vprev<>'4') then exit; //没有权限

  if qry1.fieldbyname('status').AsInteger=0 then exit;

  Lsql:='update data0101 set status =0 ,CLOSED_BY_PTR=null  where rkey='+qry1.fieldbyname('rkey').asstring;
  try
  DM.execsql(dm.qrytemp,Lsql);
  ShowMessage('取消结案成功！');
  btn_refreshClick(sender);
  except on e: Exception do
  begin
  ShowMessage('错误：'+e.Message);
  end;
  end;

end;

end.
