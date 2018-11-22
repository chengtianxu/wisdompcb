unit BOMBaojiaTypeEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.ExtCtrls, RzPanel,
  Vcl.StdCtrls, RzLabel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Data.DB, Datasnap.DBClient, GridsEh, DBAxisGridsEh, DBGridEh,
  DataIntf, DBImpl, dm, Datasnap.Provider, Vcl.Menus, RzTabs, Vcl.DBCtrls,
  RzDBEdit, EhLibVCL;

type
  TfrmBomBaoJiaTypeEdit = class(TForm)
    RzPanel1: TRzPanel;
    btn1: TRzButton;
    btn2: TRzButton;
    cdsBP01: TClientDataSet;
    cdsBP05: TClientDataSet;
    dsBP01: TDataSource;
    dsBP05: TDataSource;
    strngfldBP01IDKey: TStringField;
    strngfldBP01BP02_ptr: TStringField;
    intgrfldBP01BeiShu: TIntegerField;
    intgrfldBP01Selforder: TIntegerField;
    intgrfldBP01D34_ptr: TIntegerField;
    strngfldBP01Dept_Code: TStringField;
    strngfldBP01Dept_Name: TStringField;
    pm1: TPopupMenu;
    mniAppend: TMenuItem;
    mniDele: TMenuItem;
    mniInsert: TMenuItem;
    mniEdit: TMenuItem;
    strngfldBP05IDKey: TStringField;
    intgrfldBP05D278_ptr: TIntegerField;
    strngfldBP05ParamCode: TStringField;
    strngfldBP05ParamName: TStringField;
    strngfldBP05UnitName: TStringField;
    strngfldBP05Datatype: TStringField;
    pm2: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    pg1: TRzPageControl;
    tsTabSheet1: TRzTabSheet;
    tsTabSheet2: TRzTabSheet;
    tsTabSheet3: TRzTabSheet;
    pnl1: TRzPanel;
    lbl1: TRzLabel;
    ehBP01: TDBGridEh;
    pnl2: TRzPanel;
    lbl2: TRzLabel;
    ehBP05: TDBGridEh;
    tsTabSheet4: TRzTabSheet;
    pnl7: TRzPanel;
    btn9: TRzButton;
    mmoYaHeTxt: TRzDBMemo;
    pnl6: TRzPanel;
    btn10: TRzButton;
    chk1: TCheckBox;
    btn11: TRzButton;
    imgYaHe: TImage;
    cdsBP00: TClientDataSet;
    dsBP00: TDataSource;
    opdg1: TOpenDialog;
    strngfldBP01BP00_Ptr: TStringField;
    strngfldBP05bp00_ptr: TStringField;
    cdsBP15: TClientDataSet;
    dsBP15: TDataSource;
    strngfldBP15idkey: TStringField;
    strngfldBP15BP00_ptr: TStringField;
    strngfldBP15BP01_ptr: TStringField;
    intgrfldBP15d34_ptr: TIntegerField;
    intgrfldBP15d17_ptr: TIntegerField;
    mniMoRenCaiLiao: TMenuItem;
    intgrfldBP15d494_ptr: TIntegerField;
    intgrfldBP15d28_ptr: TIntegerField;
    intgrfldBP15beishu: TIntegerField;
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniAppendClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure mniInsertClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniMoRenCaiLiaoClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
  private
    { Private declarations }
    IBP01: IData;
    IBP05: IData;
    IBP00: IData;
    IBP15: IData;
  public
    { Public declarations }
    FIDKey: string;
    procedure GetData(IDKey: string);
    procedure LoadDefQuanJu;
  end;

var
  frmBomBaoJiaTypeEdit: TfrmBomBaoJiaTypeEdit = nil;

implementation

uses
  AddTypeDeptFrm, Pick_Item_Single, Vcl.Imaging.jpeg, BOMBaoJiaTypeEditCaiLiao;


{$R *.dfm}

procedure TfrmBomBaoJiaTypeEdit.btn10Click(Sender: TObject);
var
  LJPEG: TJPEGImage;
begin
  if opdg1.Execute then
  begin
    if opdg1.FileName <> '' then
    begin
      LJPEG := TJPEGImage.Create;
      try
        try
          if LowerCase(ExtractFileExt(opdg1.FileName)) = '.bmp' then
          begin
            imgYaHe.Picture.LoadFromFile(opdg1.FileName);
          end;
          if (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpg') or (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpeg') then
          begin
            LJPEG.LoadFromFile(opdg1.FileName);
            imgYaHe.Picture.Bitmap.Assign(LJPEG);
          end;
        except
          ShowMessage('只能导入BMP或是JPEG格式的文件');
          Exit;
        end;
      finally
        LJPEG.Free;
      end;
    end;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.btn11Click(Sender: TObject);
begin
  imgYaHe.Picture := nil;
end;

procedure TfrmBomBaoJiaTypeEdit.btn1Click(Sender: TObject);
var
  JpegImage: TJPEGImage;
  stream: TMemoryStream;
begin
  dm1.con1.BeginTrans;
  try
    jpegimage:=tjpegimage.Create;
    Stream:=TMemoryStream.Create;
    jpegimage.Assign(imgYaHe.Picture.Bitmap);
    jpegimage.JPEGNeeded;
    jpegimage.SaveToStream(stream);
    Stream.Position :=0;
    cdsBP00.Edit;
    TBlobField(cdsBP00.FieldByName('yaheimg')).LoadFromStream(stream);
    cdsBP00.Post;
    stream.Clear;
    jpegimage.Free;
    stream.Free;

    LoadDefQuanJu;
    cdsBP15.Filtered := False;

    if not PostdataByInterface(cdsBP00,IBP00) then Exit;
    if not PostdataByInterface(cdsBP01,IBP01) then Exit;
    if not PostdataByInterface(cdsbp05,IBP05) then Exit;
    if not PostdataByInterface(cdsbp15,IBP15) then Exit;


    dm1.con1.CommitTrans;
    cdsBP01.MergeChangeLog;
    cdsBP05.MergeChangeLog;
    cdsBP00.MergeChangeLog;
    cdsBP15.MergeChangeLog;
    ShowMessage('保存成功');
    ModalResult := mrOk;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('保存失败');
    end;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBomBaoJiaTypeEdit.btn9Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CODE/层压代码/150,DESCRIPTION/层压名称/150';
  LIn.Sqlstr := 'select RECORD_KEY,CODE, DESCRIPTION, layers_info from data0193 where SPEC_RKEY <> ''Y''';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP00.Edit;
      cdsBP00.FieldByName('yahetext').AsString := LFrm.adsPick1.FieldByName('layers_info').AsString;
      cdsBP00.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.chk1Click(Sender: TObject);
begin
  imgYaHe.Stretch := chk1.Checked;
end;

procedure TfrmBomBaoJiaTypeEdit.FormCreate(Sender: TObject);
begin
  IBP01 := TBP01.Create;
  IBP05 := TBP05.Create;
  IBP00 := TBp00.Create;
  IBP15 := TTableBase.Create;
end;

procedure TfrmBomBaoJiaTypeEdit.FormShow(Sender: TObject);
begin
  pg1.ActivePageIndex := 0;
end;

procedure TfrmBomBaoJiaTypeEdit.GetData(IDKey: string);
begin
  IBP01.SetSql('select * from bomprice01 where BP00_ptr = ' + QuotedStr(FIDKey) + ' order by selforder asc');
  cdsBP01.Data := IBP01.GetData;
  IBP05.SetSql('select * from bomprice05 where BP00_ptr = ' + QuotedStr(FIDKey) + ' order by d278_ptr asc');
  cdsBP05.Data := IBP05.GetData;
  LoadDefQuanJu;
  IBP00.SetSql('select * from bomprice00 where idkey = ' + QuotedStr(FIDKey));
  cdsBP00.Data := IBP00.GetData;
  Load_JPG_Pic_From_DB(cdsBP00.FieldByName('yaheimg'),imgYaHe);
  IBP15.SetSql('select * from bomprice15 where bp00_ptr = ' + QuotedStr(FIDKey) + ' order by d34_ptr asc');
  cdsBP15.Data := IBP15.GetData;
end;

procedure TfrmBomBaoJiaTypeEdit.LoadDefQuanJu;
var
  Ltmp: ITmp;
  LCds: TClientDataSet;
begin
  if not btn1.Enabled then Exit;

  LCds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try
    LCds.Data := Ltmp.SqlOpen('select rkey from data0278 where BomPriceType = 1');
    while not LCds.Eof do
    begin
      if not cdsBP05.Locate('d278_ptr',lcds.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
      begin
        cdsBP05.Append;
        cdsBP05.FieldByName('IDKey').AsString := IBP05.CreateKeyID;
        cdsBP05.FieldByName('bp00_ptr').AsString := FIDKey;
        cdsBP05.FieldByName('D278_ptr').AsInteger := lcds.FieldByName('rkey').AsInteger;
        cdsBP05.Post;
      end;
      LCds.Next;
    end;
  finally
    LCds.Free;
  end;

end;

procedure TfrmBomBaoJiaTypeEdit.mniAppendClick(Sender: TObject);
var
  LFrm: TfrmAddTypeDept;
begin
  LFrm := TfrmAddTypeDept.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP01.Append;
      cdsBP01.FieldByName('IDKey').AsString := IBP01.CreateKeyID;
      cdsBP01.FieldByName('bp00_ptr').AsString := FIDKey;
      cdsBP01.FieldByName('D34_Ptr').AsInteger := LFrm.edt1.Tag;
      cdsBP01.FieldByName('BP02_ptr').AsString := LFrm.FIDKeyBp02;
      cdsBP01.FieldByName('beishu').AsInteger := LFrm.se1.Value;
      cdsBP01.FieldByName('selforder').AsInteger := cdsBP01.RecordCount + 1;
      cdsBP01.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.mniDeleClick(Sender: TObject);
begin
  cdsBP01.Delete;
  while not cdsBP01.Eof do
  begin
    cdsBP01.Edit;
    cdsBP01.FieldByName('selforder').AsInteger := cdsBP01.FieldByName('selforder').AsInteger - 1;
    cdsBP01.Post;
    cdsBP01.Next;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.mniInsertClick(Sender: TObject);
var
  LFrm: TfrmAddTypeDept;
  LTmp: Integer;
begin
  LFrm := TfrmAddTypeDept.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      LTmp := cdsBP01.RecNo;
      cdsBP01.Insert;
      cdsBP01.FieldByName('IDKey').AsString := IBP01.CreateKeyID;
      cdsBP01.FieldByName('bp00_ptr').AsString := FIDKey;
      cdsBP01.FieldByName('D34_Ptr').AsInteger := LFrm.edt1.Tag;
      cdsBP01.FieldByName('BP02_ptr').AsString := LFrm.FIDKeyBp02;
      cdsBP01.FieldByName('beishu').AsInteger := LFrm.se1.Value;
      cdsBP01.FieldByName('selforder').AsInteger := LTmp;
      cdsBP01.Post;
      cdsBP01.Next;
      while not cdsBP01.Eof do
      begin
        cdsBP01.Edit;
        cdsBP01.FieldByName('selforder').AsInteger := cdsBP01.FieldByName('selforder').AsInteger + 1;
        cdsBP01.Post;
        cdsBP01.Next;
      end;
    end;

  finally
    LFrm.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.mniMoRenCaiLiaoClick(Sender: TObject);
var
  LFrm: TfrmBomBaoJiaTypeEditCaiLiao;

  Itmp: IData;
  LSql: string;
  LCds: TClientDataSet;
begin
  LFrm := TfrmBomBaoJiaTypeEditCaiLiao.Create(Self);
  try
    LFrm.cdsBP15.CreateDataSet;
    LFrm.FBP00_ptr := cdsBP00.FieldByName('idkey').AsString;
    LFrm.FBP01_ptr := cdsBP01.FieldByName('idkey').AsString;
    LFrm.FD34_Ptr := cdsBP01.FieldByName('d34_ptr').AsString;

    cdsBP15.Filter := 'd34_ptr = ' + cdsBP01.FieldByName('d34_ptr').AsString;
    cdsBP15.Filtered := True;
    cdsBP15.First;
    while not cdsBP15.Eof do
    begin
      LFrm.cdsBP15.Append;
      LFrm.cdsBP15.FieldByName('idkey').AsString := cdsBP15.FieldByName('idkey').AsString;
      LFrm.cdsBP15.FieldByName('BP00_ptr').AsString := cdsBP15.FieldByName('BP00_ptr').AsString;
      LFrm.cdsBP15.FieldByName('BP01_ptr').AsString := cdsBP15.FieldByName('BP01_ptr').AsString;
      LFrm.cdsBP15.FieldByName('d496_ptr').AsString := cdsBP15.FieldByName('d496_ptr').AsString;
      LFrm.cdsBP15.FieldByName('d34_ptr').AsString := cdsBP15.FieldByName('d34_ptr').AsString;
      LFrm.cdsBP15.FieldByName('d17_ptr').AsString := cdsBP15.FieldByName('d17_ptr').AsString;
      LFrm.cdsBP15.FieldByName('d28_ptr').AsString := cdsBP15.FieldByName('d28_ptr').AsString;
      LFrm.cdsBP15.FieldByName('beishu').AsString := cdsBP15.FieldByName('beishu').AsString;
      LFrm.cdsBP15.Post;
      cdsBP15.Next;
    end;

    LFrm.cbx1.Items.Clear;
    Itmp := TTmp.Create;
    LSql := ' select d496.rkey,d496.GROUP_DESC from bomprice04 bp04 ' +
            ' INNER JOIN data0496 d496 ON d496.RKEY = bp04.D496_ptr ' +
            ' where bp04.d34_ptr = ' + IntToStr(cdsBP01.FieldByName('d34_ptr').AsInteger) +
            ' ORDER by bp04.D496_ptr asc' ;
    Itmp.SetSql(LSql);
    LCds := TClientDataSet.Create(Self);
    try
      LCds.Data := Itmp.GetData;
      while not LCds.Eof do
      begin
        LFrm.cbx1.Items.AddObject(LCds.FieldByName('GROUP_DESC').AsString,Pointer(LCds.FieldByName('rkey').AsInteger));
        LCds.Next;
      end;
      if LFrm.cbx1.Items.Count > 0 then
        LFrm.cbx1.ItemIndex := 0;
    finally
      LCds.Free;
    end;

    if LFrm.ShowModal = mrOk then
    begin
      while not cdsBP15.IsEmpty do
        cdsBP15.Delete;

      LFrm.cdsBP15.First;
      while not LFrm.cdsBP15.Eof do
      begin
        cdsBP15.Append;
        cdsBP15.FieldByName('idkey').AsString := IBP15.CreateKeyID;
        cdsBP15.FieldByName('BP00_ptr').AsString := cdsBP00.FieldByName('idkey').AsString;
        cdsBP15.FieldByName('BP01_ptr').AsString := cdsBP01.FieldByName('idkey').AsString;
        cdsBP15.FieldByName('d496_ptr').AsString := LFrm.cdsBP15.FieldByName('d496_ptr').AsString;
        cdsBP15.FieldByName('d34_ptr').AsString := cdsBP01.FieldByName('d34_ptr').AsString;
        cdsBP15.FieldByName('d17_ptr').AsString := LFrm.cdsBP15.FieldByName('d17_ptr').AsString;
        cdsBP15.FieldByName('d28_ptr').AsString := LFrm.cdsBP15.FieldByName('d28_ptr').AsString;
        cdsBP15.FieldByName('beishu').AsString := LFrm.cdsBP15.FieldByName('beishu').AsString;
        cdsBP15.Post;
        LFrm.cdsBP15.Next;
      end;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TfrmBomBaoJiaTypeEdit.mniN1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'parameter_Name/参数代码/150,parameter_Desc/参数名称/150';
  LIn.Sqlstr := 'select rkey,parameter_name,parameter_desc from data0278 where BomPriceType = 1';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      if cdsBP05.Locate('D278_ptr',LFrm.adsPick1.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
      begin
        ShowMessage('请勿添加重复参数');
        Exit;
      end;
      cdsBP05.Append;
      cdsBP05.FieldByName('IDKey').AsString := IBP05.CreateKeyID;
      cdsBP05.FieldByName('bp00_ptr').AsString := FIDKey;
      cdsBP05.FieldByName('D278_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP05.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.mniN2Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'parameter_Name/参数代码/150,parameter_Desc/参数名称/150';
  LIn.Sqlstr := 'select rkey,parameter_name,parameter_desc from data0278 where BomPriceType = 1';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      if cdsBP05.Locate('D278_ptr',LFrm.adsPick1.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
      begin
        ShowMessage('请勿添加重复参数');
        Exit;
      end;
      cdsBP05.Edit;
      cdsBP05.FieldByName('D278_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP05.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEdit.mniN3Click(Sender: TObject);
begin
  cdsBP05.Delete;
end;

procedure TfrmBomBaoJiaTypeEdit.pm1Popup(Sender: TObject);
begin
  mniEdit.Enabled := not cdsBP01.IsEmpty;
  mniDele.Enabled := not cdsBP01.IsEmpty;
  mniInsert.Enabled := not cdsBP01.IsEmpty;
  mniMoRenCaiLiao.Enabled := not cdsBP01.IsEmpty;
end;

procedure TfrmBomBaoJiaTypeEdit.mniEditClick(Sender: TObject);
var
  LFrm: TfrmAddTypeDept;
begin
  LFrm := TfrmAddTypeDept.Create(Self);
  try
    LFrm.edt1.Tag := cdsBP01.FieldByName('D34_Ptr').AsInteger;
    LFrm.edt1.Text := cdsBP01.FieldByName('dept_code').AsString;
    LFrm.FIDKeyBp02 := cdsBP01.FieldByName('BP02_ptr').AsString;
    LFrm.se1.Value := cdsBP01.FieldByName('beishu').AsInteger;

    if LFrm.ShowModal = mrOk then
    begin
      cdsBP01.Edit;
      cdsBP01.FieldByName('bp00_ptr').AsString := FIDKey;
      cdsBP01.FieldByName('D34_Ptr').AsInteger := LFrm.edt1.Tag;
      cdsBP01.FieldByName('BP02_ptr').AsString := LFrm.FIDKeyBp02;
      cdsBP01.FieldByName('beishu').AsInteger := LFrm.se1.Value;
      cdsBP01.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
