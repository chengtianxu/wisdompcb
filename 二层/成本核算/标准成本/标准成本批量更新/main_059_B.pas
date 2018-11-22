unit main_059_B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  DBGridEh, Menus, DBClient, Provider;

type
  Tfrmmain_059B = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    edtKey: TEdit;
    StatusBar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label1: TLabel;
    labelKey: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ADOConnection1: TADOConnection;
    adsProdLists_Tmp: TADODataSet;
    dsProdLists: TDataSource;
    adsProdLists_TmpIsSelected: TBooleanField;
    adsProdLists_TmpRKEY: TAutoIncField;
    adsProdLists_TmpCUST_CODE: TStringField;
    adsProdLists_TmpCUSTOMER_PTR: TIntegerField;
    adsProdLists_TmpMANU_PART_NUMBER: TStringField;
    adsProdLists_TmpABBR_NAME: TStringField;
    adsProdLists_TmpTSTATUS: TWordField;
    adsProdLists_TmpBOM_STATUS: TWordField;
    adsProdLists_TmpMANU_PART_DESC: TStringField;
    adsProdLists_TmpLAST_MODIFIED_DATE: TDateTimeField;
    adsProdLists_TmpBOM_Status_CN: TStringField;
    adsProdLists_TmpBOM_APPR_DATE: TDateTimeField;
    adsProdLists_TmpBOM_APPR_BY: TIntegerField;
    adsProdLists_TmpMI_Status: TStringField;
    adsProdLists_TmpAUDITED_BY_PTR: TIntegerField;
    adsProdLists_TmpAUDITED_DATE: TDateTimeField;
    adsProdLists_TmpCOST_APPR_BY: TIntegerField;
    adsProdLists_TmpCOST_APPR_DATE: TDateTimeField;
    adsProdLists_TmpEMPLOYEE_NAME: TStringField;
    adsProdLists_TmpCost_Status: TStringField;
    adsProdLists: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    spUpdate_prod_Cost: TADOStoredProc;
    CheckBox1: TCheckBox;
    tmp: TADOQuery;
    adsProdLists_Tmpabbr_name1: TStringField;
    adsProdLists_Tmpwarehouse_code: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure dtpStartDateChange(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure adsProdLists_TmpAfterOpen(DataSet: TDataSet);
    procedure adsProdListsBeforeDelete(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    StepIncNum:integer;
    procedure DoSearch(subSql:string);
    procedure item_click(sender:TObject);
    function Update_Prod_Cost(rkey:integer;Approved:boolean):boolean;
  public
    { Public declarations }
  end;

var
  frmmain_059B: Tfrmmain_059B;

implementation
uses MyClass,ConstVar,common,QuerySet,ProcessShow;
{$R *.dfm}

procedure Tfrmmain_059B.FormCreate(Sender: TObject);
begin
 if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

   //vprev:='4';
   //user_ptr:='5';
   //ADOConnection1.Open;
end;

procedure Tfrmmain_059B.FormShow(Sender: TObject);
begin
//  user_ptr:='633';
  MyDataClass := TMyDataClass.Create(frmmain_059B.ADOConnection1);
  dtpStartDate.Date := date-3;
  dtpEndDate.Date := date;
  if (DBGridEh1.Columns.Count > 0) and (adsProdLists.Active) then
    DBGridEh1CellClick(DBGridEh1.Columns[0]);
end;

procedure Tfrmmain_059B.FormDestroy(Sender: TObject);
begin
  MyDataClass.Free;
end;

procedure Tfrmmain_059B.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmmain_059B.BitBtn3Click(Sender: TObject);
begin
  if not adsProdLists.Active then exit;
  ReSet_Sort(DBGridEh1);
  adsProdLists.Filtered:= false;
  adsProdLists_Tmp.close;
  adsProdLists_Tmp.open;
end;

procedure Tfrmmain_059B.BitBtn2Click(Sender: TObject);
begin
  if adsProdLists.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'产品BOM设计列表')
end;

procedure Tfrmmain_059B.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  if subsql='' then exit;
  sqlstr:=uppercase(adsProdLists_Tmp.CommandText);
  i:=Pos('WHERE',sqlstr);
  if i = 0 then
  begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
  end;
  Sqlstr:=copy(sqlstr,1,i-1);
  adsProdLists_Tmp.Close;
  adsProdLists_Tmp.CommandText := sqlstr+' WHERE PARENT_PTR IS NULL and D25.TSTATUS =1 '+subsql ;
  adsProdLists_Tmp.open;
//  SpeedButton1Click(nil);
  StatusBar1.Panels[1].Text := IntToStr(frmmain_059B.adsProdLists_Tmp.RecordCount);
  adsProdLists_Tmp.close;
end;

procedure Tfrmmain_059B.BitBtn4Click(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
  with TfrmQuerySet.Create(Application)do
  try
  tmp.close;
  tmp.sql.text:='select rkey,abbr_name from data0015 order by 1';
  tmp.open;
  i:=0 ;
  while not tmp.eof do
  begin
    ComboBox1.Items.Append(tmp.fields[1].asstring);
    FAc[i]:=tmp.fields[0].asinteger;
    inc(i);
    tmp.next;
  end;
  if i>0 then ComboBox1.itemindex:=0;

   if ShowModal = mrOk then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      sqlstr:=sqlstr+' and LAST_MODIFIED_DATE>='+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk1.Date))+
                     ' and LAST_MODIFIED_DATE<'+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk2.Date+1));

     if radiogroup1.ItemIndex<>radiogroup1.Items.Count-1 then
      sqlstr:=sqlstr+' and D25.TType= '+inttostr(radiogroup1.ItemIndex);
    end;
  finally
    free;
  end;
  DoSearch(sqlstr);
end;

procedure Tfrmmain_059B.DBGridEh1CellClick(Column: TColumnEh);
begin
//  if Column.Field.FieldKind = fkCalculated then abort;
  edtKey.Enabled:= not frmmain_059B.adsProdLists.IsEmpty;
  dtpStartDate.Enabled := edtKey.Enabled;
  dtpEndDate.Enabled := edtKey.Enabled;

  if frmmain_059B.adsProdLists.IsEmpty then abort;
//  SelectedField := Column.FieldName;
  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label1.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label1.Visible;
  dtpEndDate.Visible := Label1.Visible;
end;

procedure Tfrmmain_059B.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
begin
  if not frmmain_059B.adsProdLists.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if DBGridEh1.SelectedField.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := DBGridEh1.SelectedField.FieldName+'>='+TmpStr1+ ' AND ' +DBGridEh1.SelectedField.FieldName+'<'+TmpStr2;
    frmmain_059B.adsProdLists.Filter := sFilter;
    frmmain_059B.adsProdLists.Filtered:= true;
  end;
end;

procedure Tfrmmain_059B.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
begin
  if not adsProdLists.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    adsProdLists.Filtered:= false
  else
  begin
    if (DBGridEh1.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      adsProdLists.Filter := DBGridEh1.SelectedField.FieldName+' Like '+ QuotedStr(sFilter);
      adsProdLists.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := DBGridEh1.SelectedField.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      adsProdLists.Filter := sFilter;
      adsProdLists.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      adsProdLists.Filter := DBGridEh1.SelectedField.FieldName + sFilter;
      adsProdLists.Filtered:= true;
    end;
{    else if DBGridEh1.SelectedField.DataType in [ftboolean] then
    begin
      sFilter := '='+TmpStr;
      adsProdLists.Filter := DBGridEh1.SelectedField.FieldName + sFilter;
      adsProdLists.Filtered:= true;
    end;}
  end;
end;

procedure Tfrmmain_059B.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  DBGridEh1.SelectedField.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;


procedure Tfrmmain_059B.DBGridEh1TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(Column.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(Column.Field.DataSet).IndexName:='';
    TClientDataSet(Column.Field.DataSet).DeleteIndex(OldIndex);
  end;
  if Column.Title.SortMarker = smDownEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixPrimary]);
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
//      TClientDataSet(Column.Field.DataSet).DeleteIndex('px');
      Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TClientDataSet(Column.Field.DataSet).AddIndex('px',Column.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    TClientDataSet(Column.Field.DataSet).IndexName:='px';
    Column.Title.SortMarker := smDownEh;
  end;{end case}
end;

procedure Tfrmmain_059B.PopupMenu1Popup(Sender: TObject);
var
  i:integer;
  MI:TMenuItem;
begin
  while PopupMenu1.Items.Count>0 do
    PopupMenu1.Items[0].free;
  for i:= 0 to DBGridEh1.Columns.Count- 1 do
  begin
    MI:=TmenuItem.Create(self);
    MI.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
      MI.Checked:=true;
    MI.OnClick:=item_click;
    self.PopupMenu1.Items.Add(MI);
  end;
end;

procedure Tfrmmain_059B.item_click(sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to DBGridEh1.Columns.Count-1 do
    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;


procedure Tfrmmain_059B.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrmmain_059B.N2Click(Sender: TObject);
var
  sqlstr:string;
  rKey:string;
begin
if Msg_Dlg_Ask('确认已经完成该产品型号的BOM设计吗?','提示',1) then
 begin
  rKey:=adsProdLists.FieldByname('rKey').AsString;
  sqlstr:=' update data0025 set bom_appr_by='+user_ptr+',bom_appr_date=getdate(),BOM_STATUS=1 where rKey='+rKey;
  if not MyDataClass.ExecSql(sqlstr,true) then
    ShowMsg('提交失败,请稍后再试!',1)
  else
  begin
    BitBtn3Click(sender);
    frmmain_059B.adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
  end;
 end;
end;

procedure Tfrmmain_059B.PopupMenu2Popup(Sender: TObject);
var
  i,j:integer;
begin
  if adsProdLists.IsEmpty then abort;
  i:=adsProdLists.FieldByName('TSTATUS').Asinteger;
  j:=adsProdLists.FieldByName('COST_APPR_BY').Asinteger;
  MenuItem4.Enabled:= (j=0); 
  MenuItem5.Enabled:= (j>0);
  MenuItem1.Enabled:= (i=1)and(j=0);
  MenuItem2.Enabled:= J>0;//(i=1)and(j>0);
end;

procedure Tfrmmain_059B.MenuItem5Click(Sender: TObject);
var
  sqlstr:string;
  rKey:string;
begin
  if Msg_Dlg_Ask('确认取消该产品型号的成本审核吗?','提示',1) then
  begin
    rKey:=adsProdLists.FieldByname('rKey').AsString;
    sqlstr:=' update data0025 set bom_appr_by='+user_ptr+',bom_appr_date=getdate(),BOM_STATUS=0 where rKey='+rKey;
    if not MyDataClass.ExecSql(sqlstr,true) then
      ShowMsg('撤回操作失败,请稍后再试!',1)
    else
    begin
      BitBtn3Click(sender);
      adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
    end;
  end;
end;

procedure Tfrmmain_059B.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  i,j:integer;
begin
  i:=frmmain_059B.adsProdLists.FieldByName('TSTATUS').Asinteger;
  j:=frmmain_059B.adsProdLists.FieldByName('COST_APPR_BY').Asinteger;
  if (j>0) then
  begin
    DBGridEh1.Canvas.Font.Color   :=clred;
//    DBGridEh1.Canvas.Brush.Color   :=cl3DLight;     //关键
  end;
//  else if (i=1) and (j=1) then
//   DBGridEh1.Canvas.Font.Color  :=Clred;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;


procedure Tfrmmain_059B.adsProdLists_TmpAfterOpen(DataSet: TDataSet);
begin
  adsProdLists.Data:=null;
  adsProdLists.Data := DataSetProvider1.Data;
end;

procedure Tfrmmain_059B.adsProdListsBeforeDelete(DataSet: TDataSet);
begin
 abort;
end;

function Tfrmmain_059B.Update_Prod_Cost(rkey: integer;Approved:boolean): boolean;
begin
 spUpdate_prod_Cost.Parameters.ParamByName('@rKey').Value := rKey;
 spUpdate_prod_Cost.Parameters.ParamByName('@ApprovFlag').Value := Approved;
 spUpdate_prod_Cost.ExecProc;
 result := spUpdate_prod_Cost.Parameters.ParamByName('@RETURN_VALUE').value=0;
end;

procedure Tfrmmain_059B.SpeedButton3Click(Sender: TObject);
var
  old_filter:string;
  i:integer;
  bk:Tbookmark;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  if not adsProdLists.Active then exit;
  try
//    bk:= adsProdLists.GetBookmark;
    old_filter:= adsProdLists.Filter;
    adsProdLists.Filter := 'IsSelected=1';
    adsProdLists.Filtered := true;
    i:=adsProdLists.RecordCount;
    if i =0 then
    begin
      ShowMsg('请选择产品!',1);
      abort;
    end;
    frmProcessShow := TfrmProcessShow.Create(Application);
    frmProcessShow.Show;
    StepIncNum := 100 div (i+1);
    frmProcessShow.IncStep(StepIncNum,'正在更新产品成本...');
    adsProdLists.First;
    while not adsProdLists.Eof do begin
      frmProcessShow.IncStep(StepIncNum,'正在更新产品: '+adsProdLists.fieldbyName('MANU_PART_NUMBER').AsString );
      if not Update_Prod_Cost(adsProdLists.fieldbyName('RKEY').AsInteger,CheckBox1.Checked) then
      begin
        ShowMsg('更新产品: '+adsProdLists.fieldbyName('MANU_PART_NUMBER').AsString+'失败,请检查',1);
        abort;
      end;
      adsProdLists.next;
    end;
    frmProcessShow.hide;
    ShowMsg('更新产品成本已完成!',1);
//    frmProcessShow.IncStep(StepIncNum,'更新产品成本已完成!');
  finally
    if old_filter <> '' then
    begin
      adsProdLists.Filter := old_filter;
      adsProdLists.Filtered := true;
    end
    else
    begin
      adsProdLists.Filter :='';
      adsProdLists.Filtered := false;
    end;
//    adsProdLists.GotoBookmark(bk);
//    adsProdLists.FreeBookmark(bk);
    if frmProcessShow <> nil then
    begin
      frmProcessShow.Free;
    end;
    BitBtn3Click(sender);
  end;
end;

procedure Tfrmmain_059B.SpeedButton1Click(Sender: TObject);
begin
  MyDataClass.UpdateValueToField(adsProdLists,true,'IsSelected');
end;

procedure Tfrmmain_059B.SpeedButton2Click(Sender: TObject);
begin
  MyDataClass.UpdateValueToField(adsProdLists,false,'IsSelected');
end;

procedure Tfrmmain_059B.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adsprodlists_tmp.CommandText);
end;

end.
