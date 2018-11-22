unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGridEh, DB, Mask,
  ADODB, Menus;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Edit1: TEdit;
    BtnClose: TBitBtn;
    BtnBrush: TBitBtn;
    BtnQry: TBitBtn;
    BtnDef: TBitBtn;
    DS1: TDataSource;
    DS2: TDataSource;
    Panel5: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBMemo4: TDBMemo;
    Label10: TLabel;
    DBMemo5: TDBMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnDefClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtnBrushClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BtnQryClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    FColumn: TColumnEh ;
    FSql:string;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses DM_u,Frm_PrgType_u,Frm_edit_u,common,PubFunc,shellAPI,Frm_QrySet_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOCon) then
  begin
   showmessage('程序启动失败,请与管理员联系!');
   application.Terminate;
   exit;
  end;
  self.Caption:=application.Title;

   //user_ptr:='1016';
   //vprev:='4';
   //dm.ADOCon.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  FColumn:=DBGridEh1.columns[0];
  FSql:='select * from FD307 ';
  DM.ADO307.Open;
  DBMemo5.MaxLength:=DBMemo5.Field.Size;
end;

procedure TFrm_main.BtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.BtnDefClick(Sender: TObject);
begin
  with TFrm_PrgType.Create(nil) do
  try
    DM.ADO306.Open;
    if showmodal=mrok then
    begin
      if DM.ADO306.State in [dsEdit, dsInsert] then DM.ADO306.Post;
      DM.ADO306.UpdateBatch(arAll);
    end;
  finally
    DM.ADO306.Close;
    free;
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var i,j:integer;
begin
  case TMenuItem(Sender).Tag of
  0,1:
    with TFrm_edit.Create(nil) do
    try
      Ftag:=TMenuItem(Sender).Tag;
      if Ftag=0 then DM.ADO307.Append else DM.ADO307.Edit;
      init;
      if showmodal=mrok then
      begin
        try
          DM.ADOCon.BeginTrans;
          DM.ADO307.UpdateBatch(arAll);
          DM.ADO308.First;
          while not DM.ADO308.Eof do
          begin
            DM.ADO308.Edit;
            DM.ADO308source_ptr.Value:=DM.ADO307rkey.AsInteger;
            DM.ADO308.Post;
            DM.ADO308.Next;
          end;
          DM.ADO308.UpdateBatch(arAll);
          DM.ADO308.First;
          i:=1;
          while not DM.ADO308.Eof do
          begin
            for j:=low(Fmem) to high(Fmem) do
            if Fmem[j].rkey=strtoint(SGrid1.Cells[6,i]) then
            begin
               if Fmem[j].Mem.Size>0 then
               begin
                  DM.ADOImg.Close;
                  DM.ADOImg.SQL.Text:='select rkey,DocContent from FD308 where rkey='+Dm.ADO308rkey.AsString;
                  DM.ADOImg.Open;

                  PackStream(Fmem[j].Mem);
                  DM.ADOImg.Edit;
                  TBlobField(dm.ADOImg.FieldByName('DocContent')).LoadFromStream(Fmem[j].Mem);
                  DM.ADOImg.Post;
                  dm.ADOImg.Close;
               end;
               break;
            end;
            inc(i);
            DM.ADO308.Next;
          end;
          DM.ADOCon.CommitTrans;
        except
          DM.ADOCon.RollbackTrans;
          DM.ADO308.CancelUpdates;
          DM.ADO307.CancelUpdates;
          showmessage('保存失败,请与管理员联系...');
        end;
      end else begin
        DM.ADO308.CancelUpdates;
        DM.ADO307.CancelUpdates;
      end;
    finally
      free;
    end;
  2:begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select 1 from FD308 where source_ptr='+DM.ADO307rkey.AsString+' and status=1';
      DM.tmp.Open;
      if not DM.tmp.IsEmpty then
      begin
        showmessage('此项目已有结案文档,不能删除...');
        exit;
      end;
      DM.ADO307.Delete;
      DM.ADO307.UpdateBatch(arAll); //有级联删除
    end;
  3:begin
      if DM.ADO307PrgRemark.AsString='' then
      begin
        showmessage('请录入项目评价后再结案...');
        DBMemo5.ReadOnly:=false;
        DBMemo5.MaxLength:=DBMemo5.Field.Size;
        DM.ADO307.Edit;
        DBMemo5.SetFocus;
        exit;
      end;
      try
        DBMemo5.ReadOnly:=true;
        DM.ADOCon.BeginTrans;
        DM.ADO307.Edit;
        dm.tmp.Close;
        dm.tmp.SQL.Text:='select getdate()';
        dm.tmp.Open;
        DM.ADO307overDate.Value:=dm.tmp.Fields[0].AsDateTime;
        DM.ADO307status.Value:=true;
        DM.ADO307overMan.Value:=strtoint(user_ptr);
        DM.ADO307.Post;
        DM.ADO308.First;
        while not DM.ADO308.Eof do
        begin
          DM.ADO308.Edit;
          DM.ADO308status.Value:=true;
          DM.ADO308.Post;
          DM.ADO308.Next;
        end;
        DM.ADO307.UpdateBatch(arAll);
        DM.ADO308.UpdateBatch(arAll);
        DM.ADOCon.CommitTrans;
      except
        DM.ADOCon.RollbackTrans;
        DM.ADO308.CancelUpdates;
        DM.ADO307.CancelUpdates;
        showmessage('保存失败,请与管理员联系...');
      end;
    end;
  4:begin
      DM.ADO307.Edit;
      DM.ADO307status.Value:=false;
      DM.ADO307.Post;
      DM.ADO307.UpdateBatch(arAll);
    end;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4') ;
  N2.Enabled:=not DM.ADO307.IsEmpty and N1.Enabled and not DM.ADO307status.AsBoolean;
  N3.Enabled:=N2.Enabled ;
  N5.Enabled:=(vprev='4') and not DM.ADO307.IsEmpty and not DM.ADO307status.AsBoolean;
  N6.Enabled:=(vprev='4') and not DM.ADO307.IsEmpty and DM.ADO307status.AsBoolean;
end;

procedure TFrm_main.BtnBrushClick(Sender: TObject);
begin
  DM.ADO307.Close;
  DM.ADO307.Open;
end;

procedure TFrm_main.N7Click(Sender: TObject);
var 
    s:string;
    fs: TMemoryStream;
begin
  if not DirectoryExists(TmpFileDir) then
    if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
  DM.ADOImg.Close;
  DM.ADOImg.SQL.Text:='select DocContent from FD308 where rkey='+Dm.ADO308rkey.AsString;
  DM.ADOImg.Open;
  if dm.ADOImg.Fields[0].IsNull then
  begin
    showmessage('此文档为空...');
    exit;
  end;
  fs := TMemoryStream.Create;
  TBlobField(dm.ADOImg.Fields[0]).SaveToStream(fs);
  UnPackStream(fs);
  s:=TmpFileDir+dm.ADO308doc_name.AsString;
  fs.SaveToFile(s);
  fs.Free;
  ShellExecute(self.Handle,nil,pchar(s),nil,nil,SW_SHOWNORMAL);
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

  DM.ADO308.Close;
  DM.ADO308.Parameters[0].Value:=DM.ADO307rkey.Value;
  DM.ADO308.Open;
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
  sqlstr:string;
begin
  with TFrm_QrySet.Create(nil)do
  try
    if ShowModal = mrOk then
    begin
      sqlstr:=' where StartDate>='''+datetostr(DateTimePicker1.Date)+''' and StartDate<='''+datetostr(DateTimePicker2.Date)+''' ';
      for i:=1 to sgrid1.RowCount-2 do
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
    end;
  finally
    free;
  end;
  if sqlstr<>'' then
  begin
    DM.ADO307.SQL.Text:=FSql+Sqlstr;
    DM.ADO307.Close;
    DM.ADO307.Open;
  end;

end;

procedure TFrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N7.Enabled:=not DM.ADO308.IsEmpty and (vprev<>'1');
end;

end.
