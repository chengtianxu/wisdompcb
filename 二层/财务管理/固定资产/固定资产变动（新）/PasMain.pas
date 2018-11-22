unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, common, DB , Grids, DBGridEh, Menus,
  ComCtrls, Mask, DBCtrls;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    lbFilter: TLabel;
    edtFilter: TEdit;
    dbMain: TDBGridEh;
    Panel3: TPanel;
    dtpkstart: TDateTimePicker;
    dtpkend: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet3: TTabSheet;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    NOrignal: TMenuItem;
    NDepart: TMenuItem;
    NOther: TMenuItem;
    NEdit: TMenuItem;
    NDelete: TMenuItem;
    NCheck: TMenuItem;
    N8: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFilterChange(Sender: TObject);
    procedure dtpkstartChange(Sender: TObject);
    procedure NOrignalClick(Sender: TObject);
    procedure NDeleteClick(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    preColumn:TColumnEh;
    mainSql,querySql:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasQuery,DateUtils, PasModify;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adoMainrkey327.Value;
  DM.adoMain.Close;
  DM.adoMain.Open;
  DM.adoMain.IndexFieldNames:='alter_date DESC';
  if mainrkey>0 then DM.adoMain.Locate('rkey327',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if  not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,frmMain.Caption);
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpk1.Date:=dtpkstart.Date;
  frmQuery.dtpk2.Date:=dtpkend.Date;
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    DM.adoMain.Close;
    DM.adoMain.CommandText:= mainSql + #13+ querySql;
    DM.adoMain.Parameters.ParamByName('start').Value:=frmQuery.dtpk1.Date;
    DM.adoMain.Parameters.ParamByName('end').Value:=frmQuery.dtpk2.Date;
    dm.adoMain.Open;
    dtpkstart.Date:=frmQuery.dtpk1.Date;
    dtpkend.Date:=frmQuery.dtpk2.Date;
  end;
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
    Exit;
  end;
  frmMain.Caption:=Application.Title;

  LongDateFormat := 'yyyy-MM-dd';
  ShortDateFormat := 'yyyy-MM-dd';
  LongTimeFormat := 'hh:nn:ss';
  ShortTimeFormat := 'hh:nn:ss';
  DateSeparator := '-';
  TimeSeparator := ':';  
  
//  user_ptr:='3057';
//  vprev:='2';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  mainSql:=dm.adoMain.CommandText;
  dtpkend.Date:= getsystem_date(DM.adoTmp,1);
  dtpkstart.Date:=StrToDate(FormatDateTime('YYYY-MM',dtpkend.Date)+ '-01');
  with dm.adoMain do
  begin
    close;
    Parameters.ParamByName('start').Value:=dtpkstart.Date;
    Parameters.ParamByName('end').Value:=dtpkend.Date;
    open;
    IndexFieldNames:='alter_date DESC';
    First;
  end;
end;


procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName;
  end;
end;

procedure TfrmMain.dbMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssAlt in Shift) then
  begin
    ShowMessage(DM.adoMain.CommandText);
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoMain.Filtered:=False;
    DM.adoMain.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    DM.adoMain.Filtered:=True;
  end
  else
  begin
    DM.adoMain.Filter:='';
  end;
end;

procedure TfrmMain.dtpkstartChange(Sender: TObject);
begin
  DM.adoMain.Parameters.ParamByName('start').Value:=dtpkstart.Date;
  DM.adoMain.Parameters.ParamByName('end').Value:=dtpkend.Date;
  btnRefreshClick(nil);
end;

procedure TfrmMain.NOrignalClick(Sender: TObject);
begin
  if DM.adoMain.IsEmpty and (TMenuItem(Sender).Tag=5)  then Exit;
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.istatus:=TMenuItem(Sender).Tag;
    IF frmModify.ShowModal= mryes then
    begin
      btnRefreshClick(nil);
    end;;
  finally
    DM.ado327.Close;
    DM.ado327_1.Close;        
    DM.ado325_1.Close;
    DM.ado326_1.Close;
    DM.ado325_2.Close;
    DM.ado326_2.Close;
    frmModify.Free;
  end;
end;

procedure TfrmMain.NDeleteClick(Sender: TObject);
var
  Y,M,D:word;
begin
  if DM.adoMain.IsEmpty then Exit;
  with DM.adoTmp do
  begin
    Close;
    SQL.Text:='select max(rkey) as mrkey from data0327 where fasset_ptr= ' + DM.adoMainrkey.AsString;
    Open;
    if FieldByName('mrkey').AsInteger<>DM.adoMainrkey327.AsInteger then
    begin
      ShowMessage('只能对本固定资产的最后一条变更记录操作');
      exit;
    end;
  end;
  if MessageDlg('你确定要删除变更吗?',mtWarning,[mbYes,mbNo],0)= mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:=' select CURR_FYEAR,CURR_PERIOD,DEPRE_FLAG from data0508';
      Open;
      DecodeDate(DM.adoMainalter_date.Value,Y,M,D);
      IF (Y<> FieldByName('CURR_FYEAR').AsInteger) or (M <> FieldByName('CURR_PERIOD').AsInteger) then
      begin
        showmessage('删除操作必须为当前会计期间:'+DM.adoTmp.Fields[0].asstring+'/'+DM.adoTmp.Fields[1].asstring);
        exit;
      end;
      if DM.adoTmp.Fields[2].AsInteger=1 then
      begin
        showmessage('当前会计期间已提取折旧,不能删除');
        exit;
      end;
    end;

    DM.ADOConnection1.BeginTrans;         //删除功能有缺陷?当一个月内有两条同类变更时，删除后面一条，
    try                                   //前面一条查看或编辑时会有问题,不能回滚。
      with DM.adoTmp do
      begin
        Close;
        SQL.Text:='update data0517 set warehouse_ptr=b.dept_ptr, fasset_type_ptr=b.fasset_type_ptr,'+
                                              'status_ptr=b.status_ptr, ORIGINAL_VALUE=b.ORIGINAL_VALUE,'+
                                              'NET_VALUE=b.NET_VALUE,LOCATION=b.LOCATION,'+
                                              'SURPLUS_RATE=b.SURPLUS_RATE, SURPLUS=b.SURPLUS,'+
                                              'EXPECTED_LIFE_MONTHS=b.EXPECTED_LIFE_MONTHS, MONTH_DEPRE_RATE=b.MONTH_DEPRE_RATE,'+
                                              'MONTH_DEPRE_AMT=b.MONTH_DEPRE_AMT, DEPRE_ACCT_PTR=b.DEPRE_ACCT_PTR '+
                         'from data0517 d517 inner join data0327 b on d517.rkey=b.fasset_ptr '+
                         'where b.rkey='+DM.adoMainrkey327.AsString ;
        ExecSQL;

        if DM.adoMainalter_type.Value=1 then
        begin
          Close;
          SQL.Text:='delete from data0325 where (d327_ptr='+DM.adoMainrkey327.AsString +
                         ' and chgtype=2) or (fasset_ptr='+DM.adoMainrkey.AsString+' and chgtype=0)';
          ExecSQL;

          close;
          SQL.Text:='update data0325 set fasset_ptr='+DM.adoMainrkey.AsString+',d327_ptr=null,chgtype=0 '+
                                                           'where d327_ptr='+DM.adoMainrkey327.AsString+' and chgtype=1';
          ExecSQL;
        end
        else
        if DM.adoMainalter_type.Value=2 then
        begin
          Close;
          SQL.Text:='delete from data0326 where (d327_ptr='+DM.adoMainrkey327.AsString + 
                      ' and chgtype=2) or (fasset_ptr='+DM.adoMainrkey.AsString+' and chgtype=0)';
          ExecSQL;

          Close;
          SQL.Text:='update data0326 set fasset_ptr='+DM.adoMainrkey.AsString+',d327_ptr=null,chgtype=0 '+
                           'where d327_ptr='+DM.adoMainrkey327.AsString+' and chgtype=1';
          ExecSQL;
        end;

        Close;
        SQL.Text:='delete from data0327 where rkey = ' + DM.adoMainrkey327.AsString;
        if ExecSQL<>0 then
          ShowMessage('删除成功！');
      end;
      DM.ADOConnection1.CommitTrans;
      btnRefreshClick(nil);
    except
      showmessage('删除失败.');
      DM.ADOConnection1.RollbackTrans;
    end;
  end;
end;

procedure TfrmMain.NEditClick(Sender: TObject);
var
  Y,M,D:Word;
begin
  if DM.adoMain.IsEmpty then Exit;
  with DM.adoTmp do
  begin
    Close;
    SQL.Text:=' select CURR_FYEAR,CURR_PERIOD,DEPRE_FLAG from data0508' ;
    Open;
    DecodeDate(DM.adoMainalter_date.Value,Y,M,D);
    if DM.adoTmp.Fields[2].AsInteger=1 then
    begin
      showmessage('当前会计期间已提取折旧,不能删除');
      exit;
    end;
    IF (Y<> FieldByName('CURR_FYEAR').AsInteger) or (M <> FieldByName('CURR_PERIOD').AsInteger) then
    begin
      showmessage('编辑操作必须为当前会计期间:'+DM.adoTmp.Fields[0].asstring+'/'+DM.adoTmp.Fields[1].asstring);
      exit;
    end;
  end;
  with DM.adoTmp do
  begin
    Close;
    SQL.Text:='select max(rkey) as mrkey from data0327 where fasset_ptr= ' + DM.adoMainrkey.AsString;
    Open;
    if FieldByName('mrkey').AsInteger<>DM.adoMainrkey327.AsInteger then
    begin
      ShowMessage('只能对本固定资产的最后一条变更记录操作');
      Exit;
    end;
  end;
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.istatus:=TMenuItem(Sender).Tag;
    IF frmModify.ShowModal= mryes then
    begin
      btnRefreshClick(nil);
    end;;
  finally
    DM.ado327.Close;
    DM.ado327_1.Close;
    DM.ado325_1.Close;
    DM.ado326_1.Close;
    DM.ado325_2.Close;
    DM.ado326_2.Close;
    frmModify.Free;
  end;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
//  if DM.adomain.IsEmpty then abort;
  N1.Enabled:=(vprev='2') or (vprev='4') ;
  NEdit.Enabled:=N1.Enabled;
  NDelete.Enabled:=NEdit.Enabled ;
end;

end.
