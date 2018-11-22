unit Frm_Edt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls,
  DB, ADODB, DBCtrls, Menus, ActnList;

type
  TFrm_Edt = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    EdtFor: TEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label15: TLabel;
    EdtMem: TEdit;
    BtRead: TBitBtn;
    BtCal: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    M1: TMenuItem;
    BtExl: TBitBtn;
    Label2: TLabel;
    Label7: TLabel;
    EdtSumVal: TEdit;
    M3: TMenuItem;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    BtUpdate: TBitBtn;
    Label16: TLabel;
    Edit2: TEdit;
    M2: TMenuItem;
    BitBtn6: TBitBtn;
    Label17: TLabel;
    DBNavigator1: TDBNavigator;
    ActionList1: TActionList;
    ActPiror: TAction;
    ActNext: TAction;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    Label18: TLabel;
    Edit10: TEdit;
    Label19: TLabel;
    Edit11: TEdit;
    Label8: TLabel;
    Edit12: TEdit;
    Splitter1: TSplitter;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtReadClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BtExlClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtCalClick(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure EdtForEnter(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure EdtForExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure M1Click(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit2Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BtUpdateClick(Sender: TObject);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure ActPirorExecute(Sender: TObject);
    procedure ActNextExecute(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    Fdept,FFor:string;
    procedure DBEditVisble(Fformula:string);
  public
    Ftp:integer;//1 add,2 edit,3 check
    procedure init;
  end;

var
  Frm_Edt: TFrm_Edt;

implementation
 uses DM_u,common,Pick_Item_Single,ConstVar,Frm_WFIn_u,Frm_ParaUpdate_u;
{$R *.dfm}

{ TFrm_Edt }

procedure TFrm_Edt.init;
var i,iPl,iSt:integer;
begin
  if GetDeviceCaps(GetDC(self.Handle),HORZRES)>800 then
    Panel3.Width:=700;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  for i:=0 to DBGridEh1.Columns.Count-1 do DBGridEh1.Columns[i].ReadOnly:=i<>7;
  StringGrid1.Cells[0,0]:='序号';
  StringGrid1.Cells[1,0]:='参数名称';
  StringGrid1.Cells[2,0]:='单位';
  StringGrid1.Cells[3,0]:='参数值';
  for i:=1 to 10 do StringGrid1.Cells[0,i]:=' '+inttostr(i);
  if Ftp=1 then      //1 add,2 edit,3 check
  begin
    DM.GetNo(MaskEdit1,'39',0);
    DM.ADO571.Parameters[0].Value:=-1;
    DateTimePicker1.Date:=FCurrDate-1;
    DateTimePicker2.Date:=FCurrDate;
  end else if (Ftp=2) or (Ftp=3) then
  begin
    MaskEdit1.ReadOnly:=true;
    MaskEdit1.Text:=DM.ADO570number.Value;
    DM.ADO571.Parameters[0].Value:=DM.ADO570RKEY.Value;
    EdtDept.Text:=DM.ADO570dept_code.asstring;
    EdtDept.tag:=DM.ADO570rkey34.Value;
    Label2.Caption:=DM.ADO570dept_name.asstring;
    EdtFor.Text:=DM.ADO570formula_number.AsString;
    DateTimePicker1.Date:=DM.ADO570start_date.Value;
    DateTimePicker2.Date:=DM.ADO570end_date.Value;
    DateTimePicker3.Time:=DM.ADO570start_date.Value;
    DateTimePicker4.Time:=DM.ADO570end_date.Value;
    EdtSumVal.Text:=DM.ADO570theory_result.AsString;

    EdtMem.Text:=DM.ADO570master_remark.Value;
    Memo1.Text:=DM.ADO570theorycalc_meth.Value;
    EdtSumVal.Text:=DM.ADO570.FieldByName('theory_result').AsString;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 number from data0570 where rkey='+DM.ADO570Statistic_ptr.AsString;
    DM.tmp.Open;
    if  not DM.tmp.IsEmpty then
      Label17.Caption:=DM.tmp.Fieldbyname('number').AsString;    
    if Ftp=3 then
    begin
      BtnSave.Enabled:=false;
      BtRead.Enabled:=false;
      BtUpdate.Enabled:=false;
      BtCal.Enabled:=false;
      Panel2.Enabled:=false;
      M1.Enabled:=false;
      DBGridEh1.ReadOnly:=true;
      M3.Enabled:=false;
    end;
  end ;

  DM.ADO571.Open;

  EdtFor.Enabled:=DM.ADO571.IsEmpty;
  SpeedButton2.Enabled:=EdtFor.Enabled;
  EdtDept.Enabled:=EdtFor.Enabled;
  SpeedButton1.Enabled:=EdtFor.Enabled;
  DateTimePicker1.Enabled:=DateTimePicker1.Enabled and EdtFor.Enabled;
  DateTimePicker3.Enabled:=DateTimePicker1.Enabled;
  DateTimePicker2.Enabled:=EdtFor.Enabled;
  DateTimePicker4.Enabled:=EdtFor.Enabled;
  BitBtn6.Enabled:=EdtFor.Enabled;
  DBEditVisble(EdtFor.Text);
  DBGridEh1TitleClick(PreColumn);

  ActPiror.ShortCut:=38;
  ActNext.ShortCut:=40;
  
  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_Edt.BitBtn9Click(Sender: TObject);
begin
  modalresult:=mrcancel;
end;

procedure TFrm_Edt.BtReadClick(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_Edt.PopupMenu2Popup(Sender: TObject);
begin
  M1.Enabled:=Ftp in [0,1,2];
  M2.Enabled:=M1.Enabled and not DBGridEh1.DataSource.DataSet.IsEmpty and (DM.ADO571customer_name.Value<>sCust);
  M3.Enabled:=M2.Enabled;
end;

procedure TFrm_Edt.BtExlClick(Sender: TObject);
var sD1,sD2:string;
begin
 // sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
 // sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

procedure TFrm_Edt.SpeedButton1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name, ''工序'' as xz from data0034 where ttype=1';
      inputvar.KeyField:='Dept_code';
      inputvar.InPut_value:=EdtDept.Text;
    end;
    1:
    begin
      InputVar.Fields := 'formula_number/公式代码/100,dept_name/部门名称/150,xz/类别/100';
      if EdtDept.Text<>'' then
        InputVar.Sqlstr :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey,''产值统计'' as xz   from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=1 and d34.dept_code='''+EdtDept.Text+''''
      else
        InputVar.Sqlstr :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey,''产值统计'' as xz from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=1';

      inputvar.KeyField:='Dept_code';
    end;
    3:
    begin
      InputVar.Fields :='number/统计编号/100,start_date/开始日期/120,end_date/结束日期/120,closed_quantity/期末数量/100' ;
      InputVar.Sqlstr :='select rkey,number,start_date,end_date,closed_quantity from data0570 where ttype=1 and status=1 order by number';
      inputvar.KeyField:='';

    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
         label2.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
         EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     1:begin
         EdtFor.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['formula_number']);
         if EdtDept.Text='' then
         begin
           EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
           label2.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
           EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         end;
         Memo1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('theorycalc_meth').AsString;
         DBEditVisble(EdtFor.Text);         
       end;
     3:begin
         DateTimePicker1.Date:=frmPick_Item_Single.adsPick.Fieldbyname('end_date').AsDateTime;
         DateTimePicker3.Time:=frmPick_Item_Single.adsPick.Fieldbyname('end_date').AsDateTime;
         DateTimePicker1.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         DateTimePicker1.Enabled:=false;
         DateTimePicker3.Enabled:=false;
         Label17.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('number').AsString;
       end;

    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


end;

procedure TFrm_Edt.BtnSaveClick(Sender: TObject);
var sD1,sD2:string;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    exit;
  end;
  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    exit;
  end;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;
  if Ftp=1 then //add
  begin
    DM.ADO570_1.Parameters[0].Value:=-1 ;
    DM.ADO570_1.Open;
    DM.ADO570_1.Append;
    DM.ADO570_1.FieldByName('statistic_ptr').AsInteger:=DateTimePicker1.Tag;
  end else  begin
    DM.ADO570_1.Parameters[0].Value:=DM.ADO570RKEY.Value;
    DM.ADO570_1.Open;
    DM.ADO570_1.Edit;
  end;
  DM.ADO570_1.FieldByName('ttype').AsInteger:=1;
  DM.ADO570_1.FieldByName('status').AsInteger:=0 ;
  DM.ADO570_1.FieldByName('Dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO570_1.FieldByName('formula_number').AsString:=EdtFor.Text;
  DM.ADO570_1.FieldByName('start_date').AsString:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  DM.ADO570_1.FieldByName('end_date').AsString  :=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  DM.ADO570_1.FieldByName('empl_ptr').AsString:=user_ptr;
  DM.ADO570_1.FieldByName('statistic_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
  DM.ADO570_1.FieldByName('master_remark').AsString:=EdtMem.Text;
  DM.ADO570_1.FieldByName('theorycalc_meth').AsString:=Memo1.Text;
  if EdtSumVal.Text<>'' then
    DM.ADO570_1.FieldByName('theory_result').AsString:=EdtSumVal.Text;

  DM.ADOCon.BeginTrans;
  try
    if (Ftp=1)  and not DM.GetNo(MaskEdit1,'39',1) then  abort;
    DM.ADO570_1.FieldByName('NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO570_1.Post;
    DM.ADO570_1.UpdateBatch(arAll);
    if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
    DM.ADO571.Filter:='';

    if Fistate<>2 then // 570 add
    begin
      DM.ADO571.DisableControls;
      DM.ADO571.First;
      while not DM.ADO571.Eof do
      begin
        DM.ADO571.Edit;
        DM.ADO571Statistic_ptr.Value:=DM.ADO570_1.Fieldbyname('rkey').AsInteger;
        DM.ADO571.Post;
        DM.ADO571.Next;
      end;
      DM.ADO571.EnableControls;
    end;
    
    DM.ADO571.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    rkey570:=DM.ADO570_1.Fieldbyname('rkey').AsInteger;
    svFlag:=false;
    modalresult:=mrok;
  except
    on E: Exception do
    begin
      DM.ADOCon.RollbackTrans ;
      svFlag:=false;
      MessageDlg('数据保存失败...'+#13+E.Message,mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFrm_Edt.BtCalClick(Sender: TObject);
var vThr,sThr:double;
    sD1,sD2:string;
    rec:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    exit;
  end;
  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    exit;
  end;
  screen.Cursor:=crSQLWait;
  Edit2.Text:='';
  DM.ADO571.Filter:='';
  svFlag:=true;
  if not DM.ADO571.IsEmpty then rec:=DM.ADO571recno_number.AsInteger;
  DM.ADO571.DisableControls;
  DM.ADO571.First;
  while not DM.ADO571.Eof do
  begin
    vThr:=DM.Calcu(Memo1.Text);
    sThr:=sThr+vThr;
    DM.ADO571.Edit;
    DM.ADO571theory_result.Value:=vThr;
    DM.ADO571.Post;
    DM.ADO571.Next;
  end;
  svFlag:=false;
  DM.ADO571.Locate('recno_number',rec,[]);
  DM.ADO571.EnableControls;
  EdtSumVal.Text:=floattostr(sThr);
  screen.Cursor:=crDefault;
end;

procedure TFrm_Edt.EdtDeptEnter(Sender: TObject);
begin
  Fdept:=EdtDept.Text;
end;

procedure TFrm_Edt.EdtForEnter(Sender: TObject);
begin
  FFor:=EdtFor.Text;
end;

procedure TFrm_Edt.EdtDeptExit(Sender: TObject);
begin
  if self.ActiveControl=BitBtn9 then exit;
  if EdtDept.Text='' then
    Label2.Caption:=''
  else if (Fdept<>EdtDept.Text) and (EdtDept.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where ttype=1 and dept_code='''+EdtDept.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      showmessage('工序代码错误...');
      EdtDept.SetFocus;
    end else begin
      EdtDept.Tag:=DM.tmp.Fields[0].AsInteger;
      Label2.Caption:=DM.tmp.Fields[2].AsString;
      EdtFor.Text:='';
    end;
  end;
end;

procedure TFrm_Edt.EdtForExit(Sender: TObject);
begin
  if self.ActiveControl=BitBtn9 then exit;
  if (FFor<>EdtFor.Text) and (EdtFor.Text<>'') then
  begin
    DM.tmp.Close;
      if EdtDept.Text<>'' then
        DM.tmp.SQL.Text :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34 from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=1 and d34.dept_code='''+EdtDept.Text+
                        ''' and d569.formula_number='''+EdtFor.Text+''''
      else
        DM.tmp.SQL.Text:='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34 from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=1 and d569.formula_number='''+EdtFor.Text+'''';
    DM.tmp.Open;

    if DM.tmp.IsEmpty then
    begin
      showmessage('公式代码错误...');
      EdtFor.SetFocus;
    end else begin
      EdtDept.Tag:=DM.tmp.Fieldbyname('rkey34').AsInteger;
      EdtDept.Text:=DM.tmp.Fieldbyname('dept_code').AsString;
      Label2.Caption:=DM.tmp.Fieldbyname('dept_name').AsString;
      Memo1.Text:=DM.tmp.Fieldbyname('theorycalc_meth').AsString;
      DBEditVisble(EdtFor.Text);
    end;
  end;
end;

procedure TFrm_Edt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_Edt.M1Click(Sender: TObject);
var i,iPl,iSt:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    EdtDept.SetFocus;
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    EdtFor.SetFocus;
    exit;
  end;
  if not DM.ADO569.Active then
  begin
    DM.ADO569.Parameters[0].Value:=EdtFor.Text;
    DM.ADO569.Open;
  end;
  Frm_WFIn:=TFrm_WFIn.Create(nil);
  try
    Frm_WFIn.Ftp:=Tcomponent(sender).Tag;
    if Tcomponent(sender).Tag=0 then
    begin
      isWF:=true;
      DM.ADO571.Append ;
      DM.ADO571PANEL_A_B.Value:='APNL';
    end else begin
      Frm_WFIn.RadioGroup1.ItemIndex:=DM.ADO571ttype.AsInteger;
      DM.ADO571.Edit;
    end;
    Frm_WFIn.ShowModal;
  finally
    Frm_WFIn.Free;
    isWF:=false;
  end;
  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_Edt.M3Click(Sender: TObject);
begin
  if not DM.ADO572.Active then
  begin
    DM.ADO572.Parameters[0].Value:=DM.ADO570RKEY.AsInteger;
    DM.ADO572.Open;
  end;
  DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
  while not DM.ADO572.Eof do DM.ADO572.Delete;
  DM.ADO571.Delete;
  Edit11.Text:=inttostr(strtoint(Edit11.Text)-DM.ADO571pan_qty.asinteger);
  Edit12.Text:=inttostr(strtoint(Edit12.Text)-DM.ADO571set_qty.asinteger);
  DM.ADO571.Delete;
  Edit10.Text:=inttostr(DM.ADO571.RecordCount);
end;

procedure TFrm_Edt.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO571.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO571.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label16.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit2Change(Edit2);
  end ;

end;

procedure TFrm_Edt.Edit2Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit2.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit2.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit2.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_Edt.N1Click(Sender: TObject);
var sD1,sD2:string;
    i,iPl,iSt:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    exit;
  end;

  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);

  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    exit;
  end;
  if not DM.ADO569.Active then
  begin
    DM.ADO569.Parameters[0].Value:=EdtFor.Text;
    DM.ADO569.Open;
  end;

  if MessageDlg('读取本厂过板数据,将删除本厂原已读取的数据,确定吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    screen.Cursor:=crSQLWait;
    DM.readData(sD1,sD2,TMenuitem(Sender).Tag,inttostr(EdtDept.Tag));
    DM.ADO571.First;
    screen.Cursor:=crDefault;
  end;
  EdtFor.Enabled:=DM.ADO571.IsEmpty;
  SpeedButton2.Enabled:=EdtFor.Enabled;
  EdtDept.Enabled:=EdtFor.Enabled;
  SpeedButton1.Enabled:=EdtFor.Enabled;
  DateTimePicker1.Enabled:=DateTimePicker1.Enabled and EdtFor.Enabled;
  DateTimePicker3.Enabled:=DateTimePicker1.Enabled;
  DateTimePicker2.Enabled:=EdtFor.Enabled;
  DateTimePicker4.Enabled:=EdtFor.Enabled;
  BitBtn6.Enabled:=EdtFor.Enabled;

  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_Edt.BtUpdateClick(Sender: TObject);
begin
  if (EdtFor.Text<>'') and (EdtDept.Text<>'') then
    if TFrm_ParaUpdate.UpdatePara(EdtFor.Text,EdtDept.Text) then
    begin
      Memo1.Text:=DM.tmp.fieldbyname('theorycalc_meth').value;
      DM.tmp.Close;
    end;
end;

procedure TFrm_Edt.DBEdit9KeyPress(Sender: TObject; var Key: Char);
var v:double;
begin
  if DM.ADOPara.FieldByName('D_tp'+inttostr(TDBEdit(Sender).Tag)).AsInteger=1 then
  begin
    if (key='-') or (key='+') then abort;
    if (key<>#13) and (key<>#8) then
    try
      V:=strtofloat(TDBEdit(Sender).Text+Key);
    except
      abort;
    end;
  end;

end;

procedure TFrm_Edt.DBEditVisble(Fformula: string);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select * from data0569 where formula_number='''+Fformula+'''';
  DM.tmp.Open;
  DBEdit24.Visible:=not DM.tmp.fieldbyname('PARA_PTR_9').IsNull;
  DBEdit23.Visible:=not DM.tmp.fieldbyname('PARA_PTR_8').IsNull;
  DBEdit22.Visible:=not DM.tmp.fieldbyname('PARA_PTR_7').IsNull;
  DBEdit21.Visible:=not DM.tmp.fieldbyname('PARA_PTR_6').IsNull;
  DBEdit20.Visible:=not DM.tmp.fieldbyname('PARA_PTR_5').IsNull;
  DBEdit19.Visible:=not DM.tmp.fieldbyname('PARA_PTR_4').IsNull;
  DBEdit12.Visible:=not DM.tmp.fieldbyname('PARA_PTR_3').IsNull;
  DBEdit11.Visible:=not DM.tmp.fieldbyname('PARA_PTR_2').IsNull;
  DBEdit10.Visible:=not DM.tmp.fieldbyname('PARA_PTR_1').IsNull;
  DBEdit9.Visible:=not DM.tmp.fieldbyname('PARA_PTR_0').IsNull;
end;

procedure TFrm_Edt.ActPirorExecute(Sender: TObject);
begin
  DM.ADO571.Prior;
end;

procedure TFrm_Edt.ActNextExecute(Sender: TObject);
begin
  DM.ADO571.Next;
end;

end.
