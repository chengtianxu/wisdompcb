unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB,
  Menus, Mask, DBCtrls, ADODB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    Panel6: TPanel;
    DBGridEh1: TDBGridEh;
    BtnClose: TBitBtn;
    BtnBrush: TBitBtn;
    BtnQry: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    DS1: TDataSource;
    DS2: TDataSource;
    DS3: TDataSource;
    DS4: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DS5: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Shape1: TShape;
    Label22: TLabel;
    Shape2: TShape;
    DBMemo1: TDBMemo;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnQryClick(Sender: TObject);
    procedure BtnBrushClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FColumn: TColumnEh ;
    FSql:string;
    Fsrkey:string;
    function EdtVld(tp:integer):boolean;
    function isLockRec(srkey:string;unlock:boolean=false):boolean;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses DM_u,common,Frm_QrySet_u,Frm_Edit_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOCon) then
  begin
   showmsg('程序启动失败,请与管理员联系!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;


  // user_ptr:='1016';
  // vprev:='4';
  // dm.ADOCon.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  FColumn:=DBGridEh1.columns[0];
  FSql:=DM.ADO517.SQL.Text;
  DM.ADO517.Open;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
var tmpstr,sFilter:string;
    DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(DBGridEh1.DataSource.DataSet);
  if not DATASET.Active then abort;
  tmpstr:= trim(Edit1.Text);
  if TmpStr='' then
    DATASET.Filtered:= false
  else
  begin
    if (FColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end
    else if FColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := FColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end ;
  end;

end;

procedure TFrm_main.BtnQryClick(Sender: TObject);
var
  i:integer;
  sqlstr1:string;
begin
  if  Frm_QrySet=nil then
  Frm_QrySet:=TFrm_QrySet.Create(nil);
  
  with Frm_QrySet do
  if ShowModal = mrOk then
  begin
    if CBDate.Checked then
      sqlstr1:='where d327.alter_date>='''+datetostr(DateTimePicker1.Date)+''' and d327.alter_date<='''+datetostr(DateTimePicker2.Date)+''' '
   else
      sqlstr1:='where 1=1 ';
    for i:=1 to sgrid1.RowCount-2 do
    begin
      if sgrid1.Cells[2,i]<> '' then
        Sqlstr1:=Sqlstr1+sgrid1.Cells[2,i];
    end;
    DM.ADO517.Close;
    DM.ADO517.SQL.Text:='select distinct d517.rkey,d517.fasset_code,d517.fasset_name,d517.fasset_desc,d517.book_date from data0517 d517 '+
                        'left join data0327 d327 on d517.rkey=d327.fasset_ptr '+Sqlstr1+' and d517.active_flag=1';
    DM.ADO517.Open;
  end;

end;

procedure TFrm_main.BtnBrushClick(Sender: TObject);
var rkey517:integer;
begin
  rkey517:=DM.ADO517.Fieldbyname('rkey').AsInteger;
  DM.ADO517.Close;
  DM.ADO517.Open;
  DM.ADO517.Locate('rkey',rkey517,[]);
  DM.ADO517AfterScroll(nil);
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO517.IsEmpty then abort;
  N1.Enabled:=(vprev='2') or (vprev='4') ;
  N2.Enabled:=N1.Enabled and not DM.ADO327.IsEmpty;
  N3.Enabled:=N2.Enabled ;
  N8.Enabled:=not DM.ADO327.IsEmpty;
end;

procedure TFrm_main.BtnCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
var sortstring:string;
begin
  if not DBGridEh1.DataSource.DataSet.Active then exit;

  edit1.Visible:=(Column.Field.FieldKind in [fkData]) and  not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label2.Visible := edit1.Visible;
  
  if not (Column.Field.FieldKind in [fkData]) then
    DBGridEh1.OptionsEh:=DBGridEh1.OptionsEh-[dghAutoSortmarking]
  else
    DBGridEh1.OptionsEh:=DBGridEh1.OptionsEh+[dghAutoSortmarking];

  if not (Column.Field.FieldKind in [fkData]) then exit;
  Label2.Caption := Column.Title.Caption;

  case Column.Title.SortMarker of
    smNoneEh,smUpEh: sortstring := Column.FieldName + ' ASC';
    smDownEh:        sortstring := Column.FieldName + ' DESC';
  end;

  TADODataSet(DBGridEh1.DataSource.DataSet).sort:=sortstring;
  if FColumn<>Column then
  begin
    FColumn.Title.Color:=clBtnFace;
    FColumn:=Column;
  end;
  Column.Title.Color:=clred;
  DM.ADO517AfterScroll(nil);
end;

procedure TFrm_main.N5Click(Sender: TObject);
var rkey327:integer;
begin
  if not EdtVld(TMenuItem(Sender).Tag) then exit;
 // if (TMenuItem(Sender).Tag in [1,2,3,4]) and isLockRec(DM.ADO327rkey.AsString) then exit;   //给记录加锁
 // rkey327:=DM.ADO327rkey.Value;
 // DM.ADO517AfterScroll(nil);
 // DM.ADO327.Locate('rkey',rkey327,[]);
  with TFrm_Edit.Create(nil) do
  try
    Fopration:=TMenuItem(Sender).Tag;
    init;
    if showmodal=mrok then DM.ADO517AfterScroll(nil);
  finally
    DM.ADO325_1.Close;
    DM.ADO326_1.Close;
    DM.ADO325_2.Close;
    DM.ADO326_2.Close;
    DM.ADO327_1.Close;
    DM.ADO327_2.Close;
    FArryfac:=nil;
    FArryStatus:=nil;
    FArryType:=nil;
    free;
   // if (TMenuItem(Sender).Tag in [1,2,3,4]) then isLockRec(DM.ADO327rkey.AsString,true) ;//解锁
  end;

end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  if not EdtVld(5) then exit;
  //if isLockRec(DM.ADO327rkey.AsString) then exit;
  DM.ADOCon.BeginTrans;
  try
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0517 set warehouse_ptr=b.dept_ptr, fasset_type_ptr=b.fasset_type_ptr,'+
                                          'status_ptr=b.status_ptr, ORIGINAL_VALUE=b.ORIGINAL_VALUE,'+
                                          'NET_VALUE=b.NET_VALUE,LOCATION=b.LOCATION,'+
                                          'SURPLUS_RATE=b.SURPLUS_RATE, SURPLUS=b.SURPLUS,'+
                                          'EXPECTED_LIFE_MONTHS=b.EXPECTED_LIFE_MONTHS, MONTH_DEPRE_RATE=b.MONTH_DEPRE_RATE,'+
                                          'MONTH_DEPRE_AMT=b.MONTH_DEPRE_AMT, DEPRE_ACCT_PTR=b.DEPRE_ACCT_PTR '+
                     'from data0517 d517 inner join data0327 b on d517.rkey=b.fasset_ptr '+
                     'where b.rkey='+DM.ADO327rkey.AsString ;
    DM.tmp.ExecSQL;

    if DM.ADO327alter_type.Value=1 then
    begin
      DM.tmp.SQL.Text:='delete from data0325 where (d327_ptr='+DM.ADO327rkey.AsString+' and chgtype=2) or '+
                                                   '(fasset_ptr='+DM.ADO517rkey.AsString+' and chgtype=0)';
      DM.tmp.ExecSQL;

      DM.tmp.SQL.Text:='update data0325 set fasset_ptr='+DM.ADO517rkey.AsString+',d327_ptr=null,chgtype=0 '+
                                                       'where d327_ptr='+DM.ADO327rkey.AsString+' and chgtype=1';
      if DM.tmp.ExecSQL=0 then
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('删除当前变更失败...');
        exit;
      end;
    end else if DM.ADO327alter_type.Value=2 then
    begin
      DM.tmp.SQL.Text:='delete from data0326 where (d327_ptr='+DM.ADO327rkey.AsString+' and chgtype=2) or '+
                                                   '(fasset_ptr='+DM.ADO517rkey.AsString+' and chgtype=0)';
      DM.tmp.ExecSQL;

      DM.tmp.SQL.Text:='update data0326 set fasset_ptr='+DM.ADO517rkey.AsString+',d327_ptr=null,chgtype=0 '+
                       'where d327_ptr='+DM.ADO327rkey.AsString+' and chgtype=1';
      if DM.tmp.ExecSQL=0 then   //旧数据库中没有 chgtype=1的记录，不能做删除操作
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('删除当前变更失败,...');
        exit;
      end;
    end;

    DM.tmp.SQL.Text:='delete from data0327 where rkey='+DM.ADO327rkey.AsString;
    if DM.tmp.ExecSQL=0 then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('删除当前变更失败,此变更记录已被其他人删除...');
    end else DM.ADOCon.CommitTrans;
   // isLockRec(DM.ADO327rkey.AsString);
    DM.ADO517AfterScroll(nil);
  except
    DM.ADOCon.RollbackTrans;
    showmessage('删除当前变更失败...');
  end;

end;

function TFrm_main.EdtVld(tp:integer): boolean;
var Y,M,D:word;           //tp=1,2,3 add,4 edit,5 delete,8 look
begin
  if tp=8 then begin result:=true;exit;end else result:=false;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select curr_fyear,curr_period,depre_flag from data0508';
  DM.tmp.Open;
  if DM.tmp.Fields[2].AsInteger=1 then
  begin
    showmessage('当前会计期间已提取折旧,不能再新增/编辑/删除操作!');
    exit;
  end;

  if  (tp=4) or (tp=5) then
  begin
    DecodeDate(DM.ADO327.FieldByName('alter_date').AsDateTime,Y,M,D);
    if Y*12+M<>DM.tmp.Fields[0].AsInteger*12+DM.tmp.Fields[1].AsInteger then
    begin
      showmessage('编辑或删除必须为当前会计期间:'+DM.tmp.Fields[0].asstring+'/'+DM.tmp.Fields[1].asstring);
      exit;
    end;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select max(rkey) rkey from data0327 where fasset_ptr='+DM.ADO517rkey.AsString;
    DM.tmp.Open;
    if (DM.tmp.Fields[0].AsInteger<>DM.ADO327rkey.AsInteger) and not DM.ADO327.Eof then
    begin
      showmessage('编辑或删除变更只能是最后一次变更...');
      DM.ADO327.Close;
      DM.ADO327.Open;
      exit;
    end;
  end;
  result:=true;
end;

function TFrm_main.isLockRec(srkey: string;unlock:boolean=false): boolean;
begin
  result:=false;
  srkey:='##T'+srkey+DM.ADO517rkey.asstring;
  if not unlock then    //加锁
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select object_id('''+srkey+''')';
    DM.tmp.Open;
    if DM.tmp.Fields[0].AsInteger>0 then
    begin
      result:=true;
      showmessage('有人正在变更此固定资产...');
      exit;
    end else begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='create table '+srkey+'(a char(1))';
      DM.tmp.ExecSQL;
      Fsrkey:=srkey;
    end;
  end else begin     //解锁
    DM.tmp.Close;
    DM.tmp.SQL.Text:='drop table '+srkey;
    DM.tmp.ExecSQL;
    Fsrkey:='';
  end;
end;

procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  (ssAlt in  Shift) and (key=86) then
     showmessage(DM.ADO517.SQL.Text);
end;

end.
