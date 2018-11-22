unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,ShellAPI,PubFunc, DB, ADODB , common, Grids, DBGridEh, Menus;

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
    PopupMenu1: TPopupMenu;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    dbMain: TDBGridEh;
    dbAux: TDBGridEh;
    lbStatus: TLabel;
    cbxUnpost: TCheckBox;
    cbxPost: TCheckBox;
    cbxChecked: TCheckBox;
    cbxBack: TCheckBox;
    cbxExpire: TCheckBox;
    cbxRedo: TCheckBox;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    nSubmit: TMenuItem;
    nCommit: TMenuItem;
    nBack: TMenuItem;
    nRedo: TMenuItem;
    nTmpCommit: TMenuItem;
    nCancelCommit: TMenuItem;
    nExpire: TMenuItem;
    nUnExpire: TMenuItem;
    PopupMenu2: TPopupMenu;
    nAddFile: TMenuItem;
    nOpenFile: TMenuItem;
    nDeleteFile: TMenuItem;
    Label1: TLabel;
    btnBack: TBitBtn;
    Ncancel: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFilterChange(Sender: TObject);
    procedure cbxUnpostClick(Sender: TObject);
    procedure dbMainCellClick(Column: TColumnEh);
    procedure dbMainKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure nAddFileClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure nOpenFileClick(Sender: TObject);
    procedure nDeleteFileClick(Sender: TObject);
    procedure nSubmitClick(Sender: TObject);
    procedure nCommitClick(Sender: TObject);
    procedure nBackClick(Sender: TObject);
    procedure nRedoClick(Sender: TObject);
    procedure nExpireClick(Sender: TObject);
    procedure nUnExpireClick(Sender: TObject);
    procedure dbMainColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure nTmpCommitClick(Sender: TObject);
    procedure dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure nCancelCommitClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure NcancelClick(Sender: TObject);
  private
    preColumn:TColumnEh;
    mainSql,querySql,statusSql:string;
    strStatus:string;
    rkey419:Integer;
    currTime:TDateTime;
    procedure coltodb;
    procedure checkItem;
    procedure showField;
    procedure loadField(tmp:TADOQuery);
    procedure updateStatus(status:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO,DateUtils, PasQuery, PasFieldShow, PasModify, PasAddFile,
  PasTmpTo;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  currTime:=getsystem_date(DM.adoTime,1);
  mainrkey:= DM.adoMainrkey.Value;
  DM.adoMain.Close;
  DM.adoMain.CommandText:=mainSql + #13 + statusSql + #13+ querySql;
  DM.adoMain.Open;
//  dm.adoAux.Close;
//  dm.adoaux.Open;
//  if preColumn.Title.SortMarker= smUpEh then DM.adoMain.IndexFieldNames:=preColumn.FieldName
//  else DM.adoMain.IndexFieldNames:=preColumn.FieldName + ' DESC';
  if mainrkey>0 then DM.adoMain.Locate('rkey',mainrkey,[]);
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
  frmQuery.dtpkFrom.Date:= IncYear(getsystem_date(DM.adoTime,1),-1);
  frmQuery.dtpkTo.Date:=getsystem_date(DM.adoTime,1);
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    btnRefreshClick(nil);
  end;
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
  Caption:=Application.Title;

//  rkey73:='2055';
//  user_ptr:='3057';
//  vprev:='4';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  currTime:=getsystem_date(DM.adoTime,1);
  mainSql:=DM.adoMain.CommandText;
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  checkItem;  //获到状态信息
  with DM.adoMain do
  begin
    Close;
    CommandText:=mainSql + #13 + statusSql;
    Open;
//    Sort:=preColumn.FieldName;
  end;
  dm.adoAux.Open;
//  dbMainCellClick(dbMain.Columns[0]);
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey from data0419 where programe=''wzpr805.exe''';
    Open;
    if not IsEmpty then  rkey419:= FieldByName('rkey').Value
    else
    begin
      ShowMessage('不存在wzpr805这个程序');
      Exit;
    end;
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

procedure TfrmMain.checkItem;
begin
  strStatus:='';
  if cbxUnpost.Checked then strStatus:=strStatus+'1,';
  if cbxPost.Checked then strStatus:=strStatus+'2,';
  if cbxChecked.Checked then strStatus:=strStatus+'3,';
  if cbxRedo.Checked then strStatus:=strStatus+'4,';
  if cbxBack.Checked then strStatus:=strStatus+'5,';
  if cbxExpire.Checked then strStatus:=strStatus+'6,';
  if strStatus = '' then statusSql:= ' and data0805.status in (9) '
  else statusSql:=' and data0805.status in ('+ Copy(strStatus,0,Length(strStatus)-1) + ')';
end;

procedure TfrmMain.cbxUnpostClick(Sender: TObject);
begin
  checkItem;
  btnRefreshClick(nil);
end;

procedure TfrmMain.dbMainCellClick(Column: TColumnEh);
var
  rkey805:Integer;
begin
//  rkey805:= DM.adoMainrkey.Value;
//  with DM.adoAux do
//  begin
//    Close;
//    Parameters.ParamByName('rkey805').Value:= rkey805;
//    Open;
//  end;
end;

procedure TfrmMain.dbMainKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key=vk_Up) or (Key=vk_Down) then dbMainCellClick(dbMain.Columns[0]);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
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
          loadField(DM.adoTmp);       //加载字段
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
          loadField(DM.adoTmp);          //加载字段
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

procedure TfrmMain.loadField(tmp: TADOQuery);
var
  i:Integer;
begin
  with tmp do
  begin
    for i:=0 to dbMain.Columns.Count-1 do
    begin
      if (FieldByName('FieldName').Value=dbMain.Columns[i].FieldName) then
      begin
        if (FieldByName('IsDisplay').Value <> dbMain.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> dbMain.Columns[i].Width) then
        begin
          dbMain.Columns[i].Visible:= FieldByName('IsDisplay').Value;
          dbMain.Columns[i].Width:= FieldByName('FieldWidth').Value;
        end;
        dbMain.Columns[i].Index:= FieldByName('FieldOrder').Value ;
        Break;
      end;
    end;
  end;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  nAdd.Enabled:=(vprev='2') or (vprev='4');
  nEdit.Enabled:=((DM.adoMainStatus.Value=1) or (DM.adoMainStatus.Value=4) or (DM.adoMainStatus.Value=5)) and ((vprev='2') or (vprev='4'));
  nDelete.Enabled:=(DM.adoMainStatus.Value=1) and ((vprev='2') or (vprev='4'));
  nSubmit.Enabled:=(DM.adoMainStatus.Value=1) and ((vprev='2') or (vprev='4')) and (DM.adoAuxrkey.Value<>0);
  Ncancel.Enabled:= (DM.adoMainStatus.Value=2) and ((vprev='2') or (vprev='4'));
  nCommit.Enabled:= (DM.adoMainStatus.Value=2) and (vprev='4');
  nBack.Enabled:=(DM.adoMainStatus.Value=2) and (vprev='4');
  nRedo.Enabled:=(DM.adoMainStatus.Value=3) and ((vprev='2') or (vprev='4'));
  nTmpCommit.Enabled:=(DM.adoMainTemporBy.Value=False) and (vprev='4');
  nCancelCommit.Enabled:=(DM.adoMainTemporBy.Value=True) and ((vprev='2') or (vprev='4'));
  nExpire.Enabled:=(not (DM.adoMainStatus.Value=6)) and ((vprev='2') or (vprev='4'));
  nUnExpire.Enabled:=(DM.adoMainStatus.Value=6) and ((vprev='2') or (vprev='4'));
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.modifyStatus:=1;                        //新增
    frmModify.dtpkTest.Date:= getsystem_date(DM.adoTime,1);
    frmModify.dtpkEnd.Date:= IncYear(getsystem_date(DM.adoTime,1),1);
    if frmModify.ShowModal=mryes then
    begin
      dm.adoMain.Close;
      dm.adoMain.Open;
      DM.adoMain.Locate('rkey',frmModify.rkey805,[]);
    end;
  finally
    frmModify.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.modifyStatus:=2;                        //编辑
    frmModify.selRkey:=DM.adoMainrkey.Value;
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
  try
    frmModify:=TfrmModify.Create(Application);
    frmModify.modifyStatus:=3;                        //检查
    frmModify.selRkey:=DM.adoMainrkey.Value;
    frmModify.ShowModal;
  finally
    frmModify.Free;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
begin
  if DM.adoMainStatus.Value=1 then
  begin
    if MessageDlg('你确定要删除这个记录吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
    begin
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='delete from data0805 where rkey = '+ IntToStr(dm.adoMainrkey.Value);
        ExecSQL;
      end;
      btnRefreshClick(nil);
    end;
  end
  else
  begin
    ShowMessage('只有未提交的记录才能删除');
    Exit;
  end;
end;

procedure TfrmMain.nAddFileClick(Sender: TObject);
begin
  try
    frmAddFile:=TfrmAddFile.Create(Application);
    frmAddFile.rkey805:=DM.adoMainrkey.Value;
    if frmAddFile.ShowModal=mryes then
    begin
      if not (DM.adoMainStatus.Value=1) then
      begin
        updateStatus(1);
        btnRefreshClick(nil);
      end;
      dm.adoAux.Close;
      dm.adoaux.Open;
    end;
  finally
    frmAddFile.Free;
  end;
end;

procedure TfrmMain.nOpenFileClick(Sender: TObject);
var
  fs:TMemoryStream;
  filePath,fileName:string;
begin
  filePath:='D:\temp\';
  if DM.adoAuxrkey.Value=0 then exit;
  try
    fs:=TMemoryStream.Create;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey, D805_ptr, FileType, FileName, VCUT_BMP, Remarks from data0806 where rkey = '+ IntToStr(DM.adoAuxrkey.Value);
      Open;
      TBlobfield(FieldByName('VCUT_BMP')).SaveToStream(fs);        //把从数据库里的文件写入文件流
      fileName:= FieldByName('FileName').AsString;
      if not DirectoryExists(filePath) then
        if not CreateDir(filePath) then
          begin
            ShowMessage('创建临时文件夹错误：'+ filePath);
            Exit;
          end;
      UnPackStream(fs);
      fs.Position:=0;
      fs.SaveToFile(filePath + fileName);
      ShellExecute(0,'open',pchar(filePath + fileName),nil,nil,SW_SHOWNORMAL);
    end;
    fs.Free;
  except
    on E: Exception do
    begin
      fs.Free;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmMain.nDeleteFileClick(Sender: TObject);
begin
  if (DM.adoAuxrkey.Value<>0) and (MessageDlg('你确实要删除这个文件吗？',mtConfirmation,[mbYes,mbNo],0)=mryes) then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='delete from data0806 where rkey = '+ IntToStr(DM.adoAuxrkey.Value);
      ExecSQL;
    end;
    dm.adoAux.Close;
    dm.adoaux.Open;
  end;
end;

procedure TfrmMain.updateStatus(status: Integer);
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.text:='update data0805 set status='+ IntToStr(status) +' where rkey='+ IntToStr(dm.adoMainrkey.Value);
    ExecSQL;
  end;
end;

procedure TfrmMain.nSubmitClick(Sender: TObject);
var
  strEmpty:string;
begin
//  strEmpty:='';
//  with dm.adotmp do
//  begin
//    close;
//    sql.Clear;
//    sql.Text:='select rkey, D805_ptr,FileName from data0806 where rkey = '+ inttostr(dm.adoMainrkey.value);
//    open;
//    if not isempty then
//    begin
//      first;
//      while not eof do
//      begin
//        if FieldByName('FileName').asstring='' then
//           strEmpty:=''
//      end;
//    end;
//  end;
  if MessageDlg('确定要提交审核吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    updateStatus(2);
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nCommitClick(Sender: TObject);
begin
  if MessageDlg('确定要通过审核吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.text:='update data0805 set status=3,audi_ptr=' + rkey73 + ' where rkey='+ IntToStr(dm.adoMainrkey.Value);
  //    ShowMessage(SQL.Text);
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nBackClick(Sender: TObject);
begin
  if MessageDlg('确定要退回申请吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    try
      frmTmpTo:=TfrmTmpTo.Create(Application);
      frmTmpTo.Label1.Visible:=False;
      frmTmpTo.dtpkTmpTo.Visible:=False;
      frmTmpTo.status:=2;
      if frmTmpTo.ShowModal=mryes then
      begin
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.text:='update data0805 set remarks =remarks+ '+ ''' 退回原因：'''+ '+' + QuotedStr(frmTmpTo.Memo1.Lines.Text) +' where rkey='+ IntToStr(dm.adoMainrkey.Value);
//            ShowMessage(sql.Text);
          ExecSQL;
        end;
        updateStatus(5);
      end
      else
      begin
        updateStatus(5);
      end;
      frmTmpTo.Free;
      btnRefreshClick(nil);
    except
      frmTmpTo.Free;
    end;
  end;
end;

procedure TfrmMain.nRedoClick(Sender: TObject);
begin
  if MessageDlg('确定要重做吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.text:='update data0805 set status=4,audi_ptr= NULL where rkey='+ IntToStr(dm.adoMainrkey.Value);
  //    ShowMessage(SQL.Text);
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nExpireClick(Sender: TObject);
begin
  if MessageDlg('确定要失效记录吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.text:='update data0805 set status=6,audi_ptr= NULL where rkey='+ IntToStr(dm.adoMainrkey.Value);
  //    ShowMessage(SQL.Text);
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nUnExpireClick(Sender: TObject);
begin
  if MessageDlg('确定要提交审核吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    updateStatus(1);
    btnRefreshClick(nil);
  end;
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

procedure TfrmMain.nTmpCommitClick(Sender: TObject);
begin
  try
    frmTmpTo:=TfrmTmpTo.Create(Application);
    frmTmpTo.dtpkTmpTo.Date:= IncMonth(getsystem_date(DM.adoTime,1),3);
    frmTmpTo.Label2.Visible:=False;
    frmTmpTo.Memo1.Visible:=False;
    frmTmpTo.status:=1;
    if frmTmpTo.ShowModal=mryes then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.text:='update data0805 set TemporBy=1,TemporTo='+ QuotedStr(DateToStr(frmTmpTo.dtpkTmpTo.Date)) +' where rkey='+ IntToStr(dm.adoMainrkey.Value);
        ExecSQL;
      end;
      btnRefreshClick(nil);
    end;
  finally
    frmTmpTo.Free;
  end;
end;

procedure TfrmMain.dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (DM.adoMainEffeDate.AsDateTime - currTime<=30) and (DM.adoMainEffeDate.AsDateTime - currTime>0) then
      dbMain.Canvas.Font.Color := clBlue;
  if DM.adoMainEffeDate.AsDateTime - currTime<=0 then dbMain.Canvas.Font.Color := clRed;
      dbMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  nAddFile.Enabled:= (DM.adoMainStatus.Value<>2) and (DM.adoMainStatus.Value<>3) and (DM.adoMainStatus.Value<>6) and ((vprev='2') or (vprev='4'));
  nDeleteFile.Enabled:= (DM.adoMainStatus.Value<>2) and (DM.adoMainStatus.Value<>3) and (DM.adoMainStatus.Value<>6) and ((vprev='2') or (vprev='4'));
end;

procedure TfrmMain.nCancelCommitClick(Sender: TObject);
begin
  if MessageDlg('你确定要取消通过吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='update data0805 set TemporBy=0,TemporTo=NULL where rkey='+ IntToStr(dm.adoMainrkey.Value);
      ExecSQL;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.btnBackClick(Sender: TObject);
begin
  if messageDlg('你确定要把所有过期的SGS报告设置为已退回状态吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    dm.adoMain.First;
    while not dm.adoMain.Eof do
    begin
      if dm.adoMain.FieldByName('EffeDate').AsDateTime - currTime <= 0 then
        updatestatus(5);
      dm.adoMain.Next;
    end;
    btnRefreshClick(nil);
    ShowMessage('已退回,重新上传文件后方可提交审核！');
  end;
end;
procedure TfrmMain.NcancelClick(Sender: TObject);
begin
  if MessageDlg('确定要取消提交吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    updateStatus(1);
    btnRefreshClick(nil);
  end;
end;

end.

