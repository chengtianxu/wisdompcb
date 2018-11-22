unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DateUtils, Menus, ADODB,DB,
  common, Grids, DBGridEh;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    lbFilter: TLabel;
    edtFilter: TEdit;
    dbMain: TDBGridEh;
    Panel3: TPanel;
    dbAux: TDBGridEh;
    PopupMenu1: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    nAddCheck: TMenuItem;
    nDeleteCheck: TMenuItem;
    nEditCheck: TMenuItem;
    nPrint: TMenuItem;
    nAudit: TMenuItem;
    nDesigner: TMenuItem;
    N2: TMenuItem;
    Panel4: TPanel;
    btnHelp: TBitBtn;
    nReport_Rb: TMenuItem;
    chkAudit: TCheckBox;
    nUnAudit: TMenuItem;
    nDesign_tong: TMenuItem;
    nDesign_nomal: TMenuItem;
    nDesign_rb: TMenuItem;
    nNomal: TMenuItem;
    btnDesign: TBitBtn;
    nDock: TMenuItem;
    nTest: TMenuItem;
    nDesign_Dock: TMenuItem;
    nDesign_TEST: TMenuItem;
    NHF: TMenuItem;
    nDesign_HF: TMenuItem;
    N3: TMenuItem;
    pm1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    NRecord: TMenuItem;
    N6: TMenuItem;
    NCode: TMenuItem;
    NPrintCode: TMenuItem;
    N7: TMenuItem;
    mniCode: TMenuItem;
    Panel5: TPanel;
    lbl1: TLabel;
    pm2: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    NPO: TMenuItem;
    NGetPo: TMenuItem;
    NPoN: TMenuItem;
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
    procedure FormActivate(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure dbMainKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbMainColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure nAddClick(Sender: TObject);
    procedure nAddCheckClick(Sender: TObject);
    procedure nEditCheckClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nDeleteCheckClick(Sender: TObject);
    procedure nPrintClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure nAuditClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chkAuditClick(Sender: TObject);
    procedure nUnAuditClick(Sender: TObject);
    procedure nDesign_tongClick(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure NRecordClick(Sender: TObject);
    procedure NCodeClick(Sender: TObject);
    procedure NPrintCodeClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure mniCodeClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    preColumn:TColumnEh;
    mainSql,querySql,statusSql:string;
    rkey419:Integer;
    CreatedQuan:Currency;
    startDate,endDate:TDateTime;
    procedure loadField(tmp: TADOQuery;DbGrid: TDBGridEh);
    procedure coltodb;
    procedure showField;
    procedure getStatus;
    function CheckQuan(Arkey:string;AQuan:Currency):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasQuery, PasFieldShow, PasModify, PasMeasure, PasReport,
  PasDesign, PasReason, PasData, PasQReq, PasBadRecord, PasCode, ppCtrls,
  PasMulCode, PasBadDetail;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adoMainrkey.Value;
  DM.adoMain.Close;
//  DM.adoMain.CommandText:=mainSql + #13 + querySql;
  DM.adoMain.Open;
{  if preColumn.Title.SortMarker= smUpEh then
   DM.adoMain.Sort:=preColumn.FieldName
  else
   DM.adoMain.Sort:=preColumn.FieldName + ' DESC';
}
  if mainrkey>0 then DM.adoMain.Locate('rkey',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if  not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,frmMain.Caption);
end;
procedure TfrmMain.btnQueryClick(Sender: TObject);
begin
  pm1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  try
    frmFieldShow:=TfrmFieldShow.Create(Application);
    frmFieldShow.key419:=rkey419;
    if frmFieldShow.ShowModal=mryes then
    begin
      Self.showField;
    end;
  finally
    frmFieldShow.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  frmMain.caption:=application.Title;

//  rkey73:='2561';
//  vprev:='4';
//  user_ptr:='3';

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  querySql:='';
  statusSql:='';
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  mainSql:=DM.adoMain.CommandText;
  startDate:= common.getsystem_date(dm.adoTmp,1)-7;
  endDate:= common.getsystem_date(dm.adoTmp,1)+1;
  Self.getStatus;
  with DM.adoMain do
  begin
    Close;
    DM.adoMain.CommandText:= DM.adoMain.CommandText + #13 + statusSql;
    Parameters.ParamByName('dtpk1').Value:= startDate;
    Parameters.ParamByName('dtpk2').Value:= endDate;
    Open;
//    Sort:=preColumn.FieldName + ' DESC ';
  end;
  dm.adoAux.Open;
 // dbMainCellClick(dbMain.Columns[0]);
end;

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
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

  if (Column.Title.Caption<>preColumn.Title.Caption) and
     (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    edtFilter.Text:='';
    preColumn:=Column;
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

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey from data0419 where programe=''wzpr391.exe''';
    Open;
    if not IsEmpty then
     rkey419:= FieldByName('rkey').Value
    else
     begin
      ShowMessage('不存在'''+ frmMain.Caption +'''这个程序');
      Exit;
     end;
  end;
  Self.showField;
end;

procedure TfrmMain.showField;
var
  i,bool,addInt:Integer;
  addField:Boolean;
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay '+
              ' from data0849 where D419_ptr= '+ IntToStr(rkey419) +' and D073_ptr= ' + rkey73;
    Open;
    if not IsEmpty then
    begin
      if DM.adoTmp.RecordCount >= dbMain.Columns.Count then           //没有增加字段，按数据库的数据调整排序，可见以及宽度
      begin
        Sort:='FieldOrder';
        First;
        while not Eof do
        begin
          loadField(DM.adoTmp,dbMain);       //加载字段
          Next;
        end;
      end
      else
      begin                                                  //增加了字段，把新加的字段加入数据库中
        addInt:= dbMain.Columns.Count-DM.adoTmp.RecordCount;     //存增加了多少个字段
        addField:=True;
        for i:=0 to dbMain.Columns.Count-1 do
        begin
          First;
          while not Eof do
          begin
            if dbMain.Columns[i].FieldName=FieldByName('FieldName').Value then
            begin
              addField:=False;
              Break;
            end;
            addField:=True;
            Next;
          end;
          if addField then
          begin
            if dbMain.Columns[i].Visible then bool:=1
            else bool:=0;
            with DM.adoTime do
            begin
              Close;
              SQL.Clear;
              SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                    'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(dbMain.Columns[i].FieldName)+','+
                                    QuotedStr(dbMain.Columns[i].Title.Caption)+','+ IntToStr(dbMain.Columns.Count - addInt)+','+
                                    IntToStr(dbMain.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;
              ExecSQL;
            end;
            addInt:=addInt - 1;
            if addInt = 0 then Break;
          end;
        end;
        First;
        while not Eof do
        begin
          loadField(DM.adoTmp,dbMain);          //加载字段
          Next;
        end;
      end;
    end
    else
    begin
      Self.coltodb;                         //如果当前使用人员当前程序在849表没找到，则新增
    end;
  end;
end;

procedure TfrmMain.coltodb;
var
  i,bool:Integer;
begin
  with DM.adoTime do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='delete from data0849 where D419_ptr='+ IntToStr(rkey419) +' and D073_ptr='+rkey73;
    ExecSQL;
  end;
  with DM.adoTime do
  begin
    Close;
    SQL.Clear;
    for i:=0 to dbMain.Columns.Count-1 do
    begin
      if dbMain.Columns[i].Visible then bool:=1
      else bool:=0;
      SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                            'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(dbMain.Columns[i].FieldName)+','+
                            QuotedStr(dbMain.Columns[i].Title.Caption)+','+ IntToStr(dbMain.Columns[i].Index)+','+
                            IntToStr(dbMain.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;

    end;
//    ShowMessage(SQL.Text);
    ExecSQL;
  end;
end;

procedure TfrmMain.loadField(tmp: TADOQuery;DbGrid: TDBGridEh);
var
  i:Integer;
begin
  with tmp do
  begin
    for i:=0 to DbGrid.Columns.Count-1 do
    begin
      if (FieldByName('FieldName').Value=DbGrid.Columns[i].FieldName) then
      begin
        if (FieldByName('IsDisplay').Value <> DbGrid.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> DbGrid.Columns[i].Width) then
        begin
          DbGrid.Columns[i].Visible:= FieldByName('IsDisplay').Value;
          DbGrid.Columns[i].Width:= FieldByName('FieldWidth').Value;
        end;
        DbGrid.Columns[i].Index:= FieldByName('FieldOrder').Value ;
        Break;
      end;
    end;
  end;
end;

procedure TfrmMain.dbMainKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key=vk_Up) or (Key=vk_Down) then dbMainCellClick(dbMain.Columns[0]);
end;

procedure TfrmMain.dbMainColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i,tmp:Integer;
begin
  if MessageDlg('列顺序已经改变，是否保存排序？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FromIndex>ToIndex then
    begin
      tmp:=FromIndex;
      FromIndex:=ToIndex;
      ToIndex:=tmp;
    end;
    for i:= FromIndex to ToIndex do
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0849 set fieldorder='+ IntToStr(i)+' where D419_ptr='+ IntToStr(rkey419) +' and D073_ptr='+rkey73 + ' and fieldname=' + QuotedStr(dbMain.Columns[i].FieldName);
        ExecSQL;
      end;
    end;
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=1;
    if frmModify.ShowModal=mryes then
    begin
      dm.adoMain.Close;
      dm.adoMain.Open;
      DM.adoMain.Locate('rkey',frmModify.rkey391,[]);
    end;
  finally
    frmModify.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=2;
    frmModify.rkey391:=dm.adoMainrkey.AsInteger;
    if frmModify.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmModify.Free;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value<=0 then Exit;
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.status:=3;
    frmModify.rkey391:=dm.adoMainrkey.AsInteger;
    frmModify.ShowModal;
  finally
    frmModify.Free;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
var
  QUAN_REJD,rkey71:string;
begin
  if DM.adoMainrkey.Value<>0 then
  begin
    if DM.adoMainstatus.Value=1 then
    begin
      if MessageDlg('你确定要删除选中记录吗？',mtWarning,[mbYes,mbNo],0)=mryes then
      begin
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select 1 from data0022 where rkey391 = '+ DM.adoMainrkey.AsString +  #13+
                    ' union '+ #13+
                    'select 1 from data0134 where rkey391 = '+ DM.adoMainrkey.AsString;
          Open;
          if not IsEmpty then
          begin
            ShowMessage('已经有入库记录，不能删除');
            Exit;
          end;
        end;
        QUAN_REJD:=DM.adoMainrece_qty.AsString;
        rkey71:=DM.adoMainrkey71.AsString;
        try
          DM.ADOConnection1.BeginTrans;
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='update data0071 set QUAN_REJD=QUAN_REJD-'+ QUAN_REJD +' where rkey='+ rkey71;
            ExecSQL;
          end;
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='delete from data0391 where rkey='+ DM.adoMainrkey.AsString;
            ExecSQL;
          end;
          DM.ADOConnection1.CommitTrans;
          btnRefreshClick(nil);
        except
          on E: Exception do
          begin
            dm.ADOConnection1.RollbackTrans;
            messagedlg(E.Message,mterror,[mbcancel],0);
          end;
        end;
      end;
    end
    else
    begin
      ShowMessage('已审核的记录不能删除！');
      Exit;
    end;
  end;
end;

procedure TfrmMain.nAuditClick(Sender: TObject);
var
  authdate:TDateTime;
begin
  if (DM.adoMainrkey.Value<>0) and (trim(DM.adoMainjudge_result.AsString) = '不合格') then
  begin
    ShowMessage('判定结果为不合格不能审核通过，请确认并修改后再试！');
    Exit;
  end;
  if (DM.adoMainrkey.Value<>0) and (DM.adoMainstatus.Value = 1) and (MessageDlg('你确定要审核合格选中的记录吗？',mtWarning,[mbYes,mbNo],0)=mryes) then
  begin
    authdate:=getsystem_date(DM.adoTime,0);
    try
      DM.ADOConnection1.BeginTrans;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0391 set judge_result=''合格'',appr_user_ptr= '
            + user_ptr + ',status=2,appr_date=getdate(),auth_user_ptr='
            + user_ptr +',auth_date=getdate() where rkey=' + DM.adoMainrkey.AsString;
        ExecSQL;
      end;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0071 set QUAN_IN_INSP=QUAN_IN_INSP+'+ DM.adoMainrece_qty.AsString +
                  ',printed_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',authdate)) +
                  ',IQCEMPL_PTR='+ user_ptr + #13+
                  ' where rkey=' + DM.adoMainrkey71.AsString;
        ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
      btnRefreshClick(nil);
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TfrmMain.nAddCheckClick(Sender: TObject);
begin
  try
    frmMeasure:=TfrmMeasure.Create(Application);
    frmMeasure.status:=1;           //新增
    if frmMeasure.ShowModal=mryes then
    begin
     dm.adoAux.Close;
     dm.adoAux.Open;
    end;
  finally
    frmMeasure.Free;
  end;
end;

procedure TfrmMain.nEditCheckClick(Sender: TObject);
begin
  try
    frmMeasure:=TfrmMeasure.Create(Application);
    frmMeasure.status:=2;               //编辑
    if frmMeasure.ShowModal=mryes then
    begin
     dm.adoAux.Close;
     dm.adoAux.Open;
    end;
  finally
    frmMeasure.Free;
  end;
end;

procedure TfrmMain.nDeleteCheckClick(Sender: TObject);
begin
//  if DM.adoAuxrkey391.Value>0 then
//  begin
//    if MessageDlg('确定要删除选择的测量记录吗？',mtWarning,[mbYes,mbNo],0)=mryes then
//    begin
//      with DM.adoTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:='delete from data0392 where rkey391='+ DM.adoAuxrkey391.AsString +' and sr_no='+ DM.adoAuxsr_no.AsString;
//        ExecSQL;
//      end;
//     dm.adoAux.Close;
//     dm.adoAux.Open;
//    end;
//  end;
end;

procedure TfrmMain.nPrintClick(Sender: TObject);
begin
//  ShowMessage('程序目录为：'+ GetCurrentDir+'报表路径为：'+ StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
//           'IQCCheckReport.rtm');
  if DM.adoMainrkey.Value<=0 then Exit;
  try
    frmReporter:=TfrmReporter.Create(Application);
    frmReporter.ado391.Close;
    frmReporter.ado391.Parameters.ParamByName('rkey').Value:=DM.adoMainrkey.Value;
    frmReporter.ado391.Open;
    frmReporter.ADO493.Open;
    frmReporter.ado392.Close;
    frmReporter.ado392.Parameters.ParamByName('rkey391').Value:= DM.adoMainrkey.Value;
    frmReporter.ado392.Open;
    frmReporter.ADOQuery1.Close;
    frmReporter.ADOQuery1.Parameters.ParamByName('391rkey').Value:= DM.adoMainrkey.Value;
    frmReporter.ADOQuery1.Open;



    if (Sender as TmenuItem).Name='nPrint' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=False;
      frmReporter.ppReport391.Print;
    end;
    if (Sender as TmenuItem).Name='nNomal' then
    begin
      frmReporter.ppReport391_nomal.Reset;
      frmReporter.ppReport391_nomal.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport_nomal.rtm';
      frmReporter.ppReport391_nomal.Template.LoadFromFile;
      frmReporter.ppReport391_nomal.SaveAsTemplate:=False;
      frmReporter.ppReport391_nomal.Print;
    end;
    if (Sender as TmenuItem).Name='nReport_Rb' then
    begin
      frmReporter.ppReport_rb.Reset;
      frmReporter.ppReport_rb.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport_rb.rtm';
      frmReporter.ppReport_rb.Template.LoadFromFile;
      frmReporter.ppReport_rb.SaveAsTemplate:=False;
      frmReporter.ppReport_rb.Print;
    end;
    if (Sender as TmenuItem).Name='nDock' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_DOCK.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=False;
      frmReporter.ppReport391.Print;
    end;
    if (Sender as TmenuItem).Name='nTest' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_TEST.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=False;
      frmReporter.ppReport391.Print;
    end;
    if (Sender as TmenuItem).Name='NHF' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_HF.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=False;
      frmReporter.ppReport391.Print;
    end;

    if (Sender as TmenuItem).Name='NPO' then
    begin
      frmReporter.ppReportPO.Reset;
      frmReporter.ppReportPO.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'PoCodeprint.rtm';
      frmReporter.ppReportPO.Template.LoadFromFile;
      frmReporter.ppReportPO.SaveAsTemplate:=False;
      frmReporter.ppReportPO.Print;
    end;
    if (Sender as TmenuItem).Name='NPoN' then
    begin
      frmReporter.ppReportPO.Reset;
      frmReporter.ppReportPO.Template.FileName:=
        StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'PoCodeprintNo.rtm';
      frmReporter.ppReportPO.Template.LoadFromFile;
      frmReporter.ppReportPO.SaveAsTemplate:=False;
      frmReporter.ppReportPO.Print;
    end;
  finally
    frmReporter.Free;
  end;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
var
  reportname:string;
begin
    reportname:='';
    with dm.adoTmp do
    begin
      close;
      sql.Clear;
      sql.text:='select rkey496,reportname_e from data0395 where rkey496='+ inttostr(DM.adoMainGROUP_PTR.Value);
      open;
      if not isempty then
      begin
        reportname:=FieldByName('reportname_e').asstring;
      end;
    end;
  //  showmessage(reportname);
  //    showmessage((Sender as TPopupMenu).Items[10].Hint);

    nAdd.Enabled:=(vprev='2') or (vprev='4');
    nEdit.Enabled:=(DM.adoMainstatus.Value=1) and ((vprev='2') or (vprev='4'));
    nDelete.Enabled:= (DM.adoMainstatus.Value=1) and ((vprev='2') or (vprev='4'));
    nPrint.Visible:= ((vprev='2') or (vprev='4')) and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[6].Hint)) or (reportname=''));
    nNomal.Visible:=  ((vprev='2') or (vprev='4'));          // and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[5].Hint)) or (reportname=''));
    nReport_Rb.Visible:= ((vprev='2') or (vprev='4')) and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[7].Hint)) or (reportname=''));
    nDock.Visible:=  ((vprev='2') or (vprev='4')) and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[8].Hint)) or (reportname=''));
    nTest.Visible:= ((vprev='2') or (vprev='4')) and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[9].Hint)) or (reportname=''));
    NHF.Visible:= ((vprev='2') or (vprev='4')) and ((uppercase(reportname)=uppercase((Sender as TPopupMenu).Items[10].Hint)) or (reportname=''));
    nDesigner.Enabled:= vprev='4';
    nAudit.Enabled:= (vprev='4') and (DM.adoMainstatus.Value=1);
    N3.Enabled:= (vprev='4') and (DM.adoMainstatus.Value=1);
    nUnAudit.Enabled:=(vprev='4') and (DM.adoMainstatus.Value=2) or (DM.adoMainstatus.Value=3);
    nCheck.Enabled:= DM.adoMainrkey.Value <> 0;
    NCode.Enabled:= (DM.adoMainrkey.Value <> 0) and ((vprev='2') or (vprev='4'));
    N7.Enabled:= (DM.adoMainrkey.Value <> 0) and ((vprev='2') or (vprev='4'));
    NPrintCode.Enabled:= (DM.adoMainrkey.Value <> 0) and ((vprev='2') or (vprev='4'));
    NPO.Enabled:=((vprev='2') or (vprev='4'));
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  nAddCheck.Enabled:= (DM.adoMainstatus.Value=1) and ((vprev='2') or (vprev='4'));
  nEditCheck.Enabled:= (DM.adoMainstatus.Value=1) and ((vprev='2') or (vprev='4'));
  nDeleteCheck.Enabled:= (DM.adoMainstatus.Value=1) and ((vprev='2') or (vprev='4'));
end;

procedure TfrmMain.btnHelpClick(Sender: TObject);
begin
  ShowMessage('程序权限设定：'+#13+
              '   2与4权限可以新增与编辑'+ #13+
              '   4权限才能审核与定义报表'+ #13+
              '   4权限才能类型定义');
end;

procedure TfrmMain.dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DM.adoMainstatus.Value = 2 then
     dbMain.Canvas.Font.Color := clred;
  if DM.adoMainstatus.Value = 3 then
     dbMain.Canvas.Font.Color := clBlue;
  if not DM.adoMainstock_over.AsBoolean then
    dbMain.Canvas.Brush.Color:= clMoneyGreen;
  dbMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.getStatus;
begin
  if chkAudit.Checked then  statusSql:= ''
  else statusSql:=' and data0391.status=1 ';
end;

procedure TfrmMain.chkAuditClick(Sender: TObject);
begin
  Self.getStatus;
  DM.adoMain.Close;
  DM.adoMain.CommandText:=mainSql + #13 + querySql+ #13 + statusSql;
  DM.adoMain.Parameters.ParamByName('dtpk1').Value:=startDate;
  DM.adoMain.Parameters.ParamByName('dtpk2').Value:=endDate;
  DM.adoMain.Open;
end;

procedure TfrmMain.nUnAuditClick(Sender: TObject);
begin
  if (DM.adoMainrkey.Value<>0)
          and (MessageDlg('你确定要退回已经审核的记录吗？',mtWarning,[mbYes,mbNo],0)=mryes) then
  begin
    if DM.adoMainstatus.Value=2 then
    begin
      with dm.adotmp do
      begin
        close;
        SQL.Clear;
        SQL.Text:='select 1 from data0022 where RKEY391= ' + DM.adoMainrkey.AsString + ' and (QUANTITY - QUAN_ON_HAND) > 0';
        Open;
        if not IsEmpty then
        begin
          ShowMessage('材料已发放不能退回');
          exit;
        end;
      end;

      try
        DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0391 set judge_result=''合格'',status=1,auth_user_ptr=' + user_ptr +',auth_date=getdate() where rkey=' + DM.adoMainrkey.AsString;
          ExecSQL;
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0071 set QUAN_IN_INSP = QUAN_IN_INSP - '+ DM.adoMainrece_qty.AsString +
                    ',printed_date= NULL,IQCEMPL_PTR= NULL '+ #13+
                    ' where rkey=' + DM.adoMainrkey71.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end
    else  IF  DM.adoMainstatus.Value=3 THEN                              //修改时要注意数据平衡
    begin
//      ShowMessage('审核不合格不能退审！！');
//      Exit;
      try
        DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0391 set judge_result=''合格'',status=1,auth_user_ptr=' + user_ptr +',auth_date=getdate() where rkey=' + DM.adoMainrkey.AsString;
          ExecSQL;
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0071 set QUAN_REJD = QUAN_REJD +'+ DM.adoMainrece_qty.AsString +
                    ',printed_date= NULL,IQCEMPL_PTR= NULL '+ #13+
                    ' where rkey=' + DM.adoMainrkey71.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.nDesign_tongClick(Sender: TObject);
begin
  try
    frmReporter:=TfrmReporter.Create(Application);
    if (Sender as TmenuItem).Name='nDesign_nomal' then
    begin
      frmReporter.ppReport391_nomal.Reset;
      frmReporter.ppReport391_nomal.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport_nomal.rtm';
      frmReporter.ppReport391_nomal.Template.LoadFromFile;
      frmReporter.ppReport391_nomal.SaveAsTemplate:=True;
      frmReporter.ppDesigner_nomal.ShowModal;
    end;
    if (Sender as TmenuItem).Name='nDesign_tong' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=True;
      frmReporter.ppDesigner391.ShowModal;
    end;
    if (Sender as TmenuItem).Name='nDesign_rb' then
    begin
      frmReporter.ppReport_rb.Reset;
      frmReporter.ppReport_rb.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCheckReport_rb.rtm';
      frmReporter.ppReport_rb.Template.LoadFromFile;
      frmReporter.ppReport_rb.SaveAsTemplate:=True;
      frmReporter.ppDesigner_rb.ShowModal;
    end;
    if (Sender as TmenuItem).Name='nDesign_Dock' then
    begin
      frmReporter.ppReport391.Reset;
      frmReporter.ppReport391.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_DOCK.rtm';
      frmReporter.ppReport391.Template.LoadFromFile;
      frmReporter.ppReport391.SaveAsTemplate:=True;
      frmReporter.ppDesigner391.ShowModal;
    end;
    if (Sender as TmenuItem).Name='nDesign_TEST' then
    begin
      frmReporter.ppReport_rb.Reset;
      frmReporter.ppReport_rb.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_TEST.rtm';
      frmReporter.ppReport_rb.Template.LoadFromFile;
      frmReporter.ppReport_rb.SaveAsTemplate:=True;
      frmReporter.ppDesigner_rb.ShowModal;
    end;
    if (Sender as TmenuItem).Name='nDesign_HF' then
    begin
      frmReporter.ppReport_rb.Reset;
      frmReporter.ppReport_rb.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'IQCCHECKREPORT_HF.rtm';
      frmReporter.ppReport_rb.Template.LoadFromFile;
      frmReporter.ppReport_rb.SaveAsTemplate:=True;
      frmReporter.ppDesigner_rb.ShowModal;
    end;
    if (Sender as TmenuItem).Name='NGetPo' then
    begin
      frmReporter.ppReportPO.Reset;
      frmReporter.ppReportPO.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
           'PoCodeprint.rtm';
      frmReporter.ppReportPO.Template.LoadFromFile;
      frmReporter.ppReportPO.SaveAsTemplate:=True;
      frmReporter.ppDesignerPO.ShowModal;
    end

  finally
    frmReporter.Free;
  end;
end;

procedure TfrmMain.btnDesignClick(Sender: TObject);
begin
  if not (vprev='4') then
  begin
    showmessage('你没有权限操作');
    exit;
  end;
  try
    frmDesign:=TfrmDesign.Create(application);
    frmDesign.showmodal;
  finally
    frmDesign.Free;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
var
  authdate:TDateTime;
  LFrm:TfrmReason;
  Lfrm2: TfrmBadDetail;
begin
  if (DM.adoMainrkey.Value<>0) and (DM.adoMainstatus.Value = 1)
          and (MessageDlg('你确定要审核不合格选中的记录吗？',mtWarning,[mbYes,mbNo],0)<>mryes) then  Exit;

  with DM.adoTmp do
  begin
    Close;
    sql.Text:= 'SELECT RKEY FROM DATA0022 WHERE RKEY391 = ' + DM.adoMainrkey.AsString + #13+
                ' union '+ #13+
                'SELECT RKEY FROM DATA0134 WHERE RKEY391 = ' + DM.adoMainrkey.AsString;
    Open;
    if not IsEmpty then
    begin
      ShowMessage('材料已入库，请退仓后再重新审核');
      Exit;
    end;
  end;

  Lfrm:= TfrmReason.Create(Application);
  try
    if LFrm.ShowModal = mrok then
    begin
      authdate:=getsystem_date(DM.adoTime,0);
      try
        DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0391 set judge_result=''不合格'',appr_user_ptr= '
              + user_ptr + ',status=3,appr_date=getdate(),remark = remark + '+ QuotedStr(Trim(LFrm.mmo1.Text))  +
              ',auth_user_ptr=' + user_ptr +',auth_date=getdate() where rkey=' + DM.adoMainrkey.AsString;
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update data0071 set QUAN_REJD = QUAN_REJD -'+ DM.adoMainrece_qty.AsString +
                    ' where rkey=' + DM.adoMainrkey71.AsString;
//          ShowMessage(SQL.Text);
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        Lfrm2:= TfrmBadDetail.Create(Application);
        try
          Lfrm2.edtCode.Text:= DM.adoMain.fieldbyname('ABBR_NAME').AsString;
          Lfrm2.lbl3.Caption:= DM.adoMain.fieldbyname('SUPPLIER_NAME').AsString;
          Lfrm2.edtCode.Tag:=DM.adoMain.fieldbyname('supplier_pointer').AsInteger;
          Lfrm2.edtINVT.Text:= DM.adoMain.fieldbyname('INV_PART_NUMBER').AsString;
          Lfrm2.lbl4.Caption:= DM.adoMain.fieldbyname('INV_PART_DESCRIPTION').AsString;
          Lfrm2.edtINVT.Tag:= DM.adoMain.fieldbyname('rkey17').AsInteger;
          Lfrm2.edtBatch.Text:=  DM.adoMain.fieldbyname('iqc_number').AsString;
          Lfrm2.ShowModal;
        finally
          Lfrm2.Free;
        end;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N4Click(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);

  frmQuery.dtpkFrom.Date:= DM.adoMain.Parameters.ParamByName('dtpk1').Value;
  frmQuery.dtpkTo.Date:= DM.adoMain.Parameters.ParamByName('dtpk2').Value-1;
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=querySql+frmQuery.sgCondition.Cells[2,i]+ #13;
    end;
    startDate:= frmQuery.dtpkFrom.Date;
    endDate:= frmQuery.dtpkTo.Date+1;
    DM.adoMain.Close;
    DM.adoMain.CommandText:=mainSql + #13 + querySql+ #13 + statusSql;
    DM.adoMain.Parameters.ParamByName('dtpk1').Value:=startDate;
    DM.adoMain.Parameters.ParamByName('dtpk2').Value:=endDate;
    DM.adoMain.Open;
  end;
end;

procedure TfrmMain.N5Click(Sender: TObject);
var
   Lfrm:TfrmQRep;
begin
  Lfrm:= TfrmQRep.Create(Application);
  try
    Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.NRecordClick(Sender: TObject);
var
  Lfrm:TfrmBadRecord;
begin
  Lfrm:= TfrmBadRecord.Create(Application);
  try
    Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmMain.NCodeClick(Sender: TObject);
var
  LFrm: TfrmCode;
begin
  if not CheckQuan(DM.adoMainrkey.AsString,DM.adoMainrece_qty.Value) then
  begin
    ShowMessage('数量已经分配完，不能再分配');
    Exit;
  end;

  LFrm:= TfrmCode.Create(Application);
  try
    LFrm.edtCode.Text:= DM.adoMainINV_PART_NUMBER.AsString;
    LFrm.edtName.Text:= DM.adoMainINV_DESCRIPTION.AsString;
    LFrm.edtbatch.Text:= DM.adoMainbarch_no.AsString;
    LFrm.edtcreate.Text:= DM.adoMainmanufacture_TDATE.AsString;
    LFrm.edt1.Text:= dm.adoMainextrl_date.AsString;
    LFrm.edtQuan.Text:= CurrToStr(DM.adomainrece_qty.Value - CreatedQuan);
    LFrm.edtMidQuan.Text:= LFrm.edtQuan.Text;
    LFrm.edtMidQuanExit(nil);
    LFrm.lbl7.Caption:= DM.adoMainunit_name.AsString;
    LFrm.lbl8.Caption:= DM.adoMainunit_name.AsString;
//    LFrm.effday:= DaysBetween(DM.adoMainmanufacture_TDATE.Value,DM.adoMainextrl_date.Value);
    if LFrm.ShowModal = mrok then    btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.NPrintCodeClick(Sender: TObject);
var
  LFrm: TfrmReporter;
  Img2DBar: TppImage;
  I,J: Integer;
  LText: string;
begin
  LFrm:= TfrmReporter.Create(Application);
  try
    LFrm.qryCode.Close;
    LFrm.qryCode.Parameters[0].Value:= DM.adoMainrkey.Value;
    LFrm.qryCode.Open;
    if LFrm.qryCode.IsEmpty then
    begin
      ShowMessage('无可打印标签，请先生成标签');
      Exit;
    end;
    LFrm.ppReportCode.Reset;
    LFrm.ppReportCode.Template.FileName :=
              StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'IQCCode.rtm';
    LFrm.ppReportCode.Template.LoadFromFile;


    LFrm.ppReportCode.ObjectByName(I,J,'ppImage1');

    Img2DBar := LFrm.ppReportCode.Bands[I].Objects[J] as TppImage;
    LText := Lfrm.qryCode.fieldbyname('条码编号').AsString;
    LFrm.Get2DCodeBmp(LText,Img2DBar.Picture);

    LFrm.ppReportCode.SaveAsTemplate:= False;
//    LFrm.ppReportCode.ShowPrintDialog := False;
    LFrm.ppReportCode.SaveAsTemplate:= False;
//    LFrm.ppReportCode.DeviceType := 'Printer';
//    LFrm.ppReportCode.PrinterSetup.PrinterName := gPrintName;
    LFrm.ppReportCode.Print;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N7Click(Sender: TObject);
var
    Lfrm:TfrmMulCode;
begin
  if not CheckQuan(DM.adoMainrkey.AsString,DM.adoMainrece_qty.Value) then
  begin
    ShowMessage('数量已经分配完，不能再分配');
    Exit;
  end;
  LFrm:= TfrmMulCode.Create(Application);
  try
    LFrm.edtCode.Text:= DM.adoMainINV_PART_NUMBER.AsString;
    LFrm.edtName.Text:= DM.adoMainINV_DESCRIPTION.AsString;
    LFrm.edtQuan.Text:= CurrToStr(DM.adomainrece_qty.Value - CreatedQuan);
    LFrm.edtMidQuan.Text:= LFrm.edtQuan.Text;
    Lfrm.edt1.Text:= LFrm.edtMidQuan.Text;
    LFrm.edtbatch.Text:= DM.adoMainbarch_no.AsString;
    LFrm.edtcreate.Text:= DM.adoMainmanufacture_TDATE.AsString;
    LFrm.Edit1.Text:= dm.adoMainextrl_date.AsString;
    LFrm.lbl7.Caption:= DM.adoMainunit_name.AsString;
    LFrm.lbl8.Caption:= DM.adoMainunit_name.AsString;
    LFrm.lbl4.Caption:= DM.adoMainunit_name.AsString;

    LFrm.edt1Exit(nil);
    if LFrm.ShowModal = mrok then    btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

function TfrmMain.CheckQuan(Arkey: string;AQuan:Currency): Boolean;
begin
  Result:= False;

  with DM.adoTmp do
  begin
    Close;
    SQL.Text:= 'select isnull(sum(quantity),0) as total from data0396 where rkey391=' + Arkey;
    Open;
    if not IsEmpty then
    begin
      if Fields[0].Value < AQuan then
      begin
        CreatedQuan:= Fields[0].Value;
        Result:= True;
      end;
    end
    else
    begin
      CreatedQuan:= 0;
      Result:= True;
    end;
  end;
end;

procedure TfrmMain.mniCodeClick(Sender: TObject);
var
  LFrm: TfrmReporter;
begin
  LFrm:=TfrmReporter.Create(Application);
  try
    LFrm.ppReportCode.Reset;
    LFrm.ppReportCode.Template.FileName:= StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'IQCCode.rtm';
    LFrm.ppReportCode.Template.LoadFromFile;
    LFrm.ppReportCode.SaveAsTemplate:=True;
    LFrm.ppDesignerCode.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N8Click(Sender: TObject);
var
  LFrm: TfrmReporter;
  Img2DBar: TppImage;
  I,J: Integer;
  LText: string;
begin
  LFrm:= TfrmReporter.Create(Application);
  try
    LFrm.qryCode.Close;
    Lfrm.qryCode.SQL.Text:='SELECT dbo.data0396.rkey as 条码编号,dbo.Data0017.INV_PART_NUMBER as 材料编码    '+#13+
        '  ,dbo.data0391.iqc_number AS IQC编号        '+#13+
        '  ,dbo.Data0070.PO_NUMBER AS 采购单号,dbo.data0002.unit_name AS 单位,dbo.data0071.reason AS 请购原因,dbo.Data0017.INV_NAME AS 材料名称    '+#13+
        '  ,dbo.Data0017.INV_PART_DESCRIPTION AS 材料描述                       '+#13+
        '  ,dbo.Data0017.INV_DESCRIPTION AS 材料规格, dbo.Data0023.CODE AS 供应商代码, dbo.Data0023.ABBR_NAME AS 供应商简称    '+#13+
        '  ,dbo.data0391.supplier_model AS 供应商型号, dbo.Data0017.INV_NAME + '' '' + dbo.data0391.supplier_model AS 名称型号  '+#13+
        '  ,dbo.data0391.sgs_no AS SGS编号,dbo.data0391.sgs_date AS SGS日期, dbo.data0391.rece_qty AS 来料数量     '+#13+
        '  ,dbo.data0391.iqc_qty AS 检查数量, dbo.data0396.batchno AS 批号    '+#13+
        '  ,dbo.data0396.manufacture_TDATE AS 制造日期    '+#13+
        '  ,dbo.data0391.appr_date AS IQC检查日期,dbo.data0391.auth_date AS IQC审核日期     '+#13+
        '  ,case data0391.if_halogen when 1 then ''是'' else ''否'' end as 是否无卤素,dbo.data0391.appearance AS 外观     '+#13+
        '  ,dbo.data0391.part_size AS 产品尺寸, dbo.data0391.part_thickness AS 板料厚度, dbo.data0391.tong_thickness 铜箔厚度      '+#13+
        '  ,dbo.data0391.thick_tolerance AS 厚度公差, dbo.data0391.ht_remark 是否含铜         '+#13+
        '  ,dbo.data0391.if_standard AS 是否符合标准, dbo.data0396.extrl_date AS 有效期, dbo.data0391.judge_result AS 判定结果   '+#13+
        '  , dbo.data0391.remark AS 备注       '+#13+
        '  ,dbo.Data0071.IF_CAF AS 是否CAF   '+#13+
        '  FROM DATA0396     '+#13+
        '    inner join dbo.DATA0391 on DATA0396.rkey391 = DATA0391.rkey   '+#13+
        '    INNER JOIN dbo.Data0071 on dbo.DATA0391.rkey71 = dbo.Data0071.RKEY      '+#13+
        '    INNER join dbo.Data0017 on dbo.DATA0391.rkey17 =  dbo.Data0017.RKEY   '+#13+
        '    INNER JOIN dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY   '+#13+
        '                  INNER JOIN dbo.Data0002 ON dbo.data0071.purchase_unit_ptr = dbo.Data0002.RKEY        '+#13+
        '                 INNER JOIN dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY      '+#13+
        '  WHERE data0396.rkey = ' + DM.adoAuxrkey.AsString;
    LFrm.qryCode.Open;
    if LFrm.qryCode.IsEmpty then
    begin
      ShowMessage('无可打印标签，请先生成标签');
      Exit;
    end;
    LFrm.ppReportCode.Reset;
    LFrm.ppReportCode.Template.FileName :=
              StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'IQCCode.rtm';
    LFrm.ppReportCode.Template.LoadFromFile;


    LFrm.ppReportCode.ObjectByName(I,J,'ppImage1');

    Img2DBar := LFrm.ppReportCode.Bands[I].Objects[J] as TppImage;
    LText := Lfrm.qryCode.fieldbyname('条码编号').AsString;
    LFrm.Get2DCodeBmp(LText,Img2DBar.Picture);

    LFrm.ppReportCode.SaveAsTemplate:= False;
//    LFrm.ppReportCode.ShowPrintDialog := False;
    LFrm.ppReportCode.SaveAsTemplate:= False;
//    LFrm.ppReportCode.DeviceType := 'Printer';
//    LFrm.ppReportCode.PrinterSetup.PrinterName := gPrintName;
    LFrm.ppReportCode.Print;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.pm2Popup(Sender: TObject);
begin
  N8.Enabled := not DM.adoAux.IsEmpty;
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  if MessageDlg('确定要删除此标签吗?', mtWarning,[mbYes,mbNo],0) = mryes then
  begin
    with dm.adoTmp do
    begin
      Close;
      SQL.Text:= 'delete from data0396 where rkey = ' + DM.adoAuxrkey.AsString;
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  ShowMessage('权限3,4 打印物料标签');
end;

end.
