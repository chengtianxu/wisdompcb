unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Buttons, Grids, DBGridEh, Menus, DM;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    eh1: TDBGridEh;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    ads1: TADODataSet;
    ds1: TDataSource;
    ads1IDkey: TGuidField;
    ads1rkey: TAutoIncField;
    ads1D25_Ptr: TIntegerField;
    ads1MatchID: TStringField;
    ads1CAMName: TStringField;
    ads1CAMVer: TFloatField;
    ads1CAMDesc: TStringField;
    ads1CAMTxt: TMemoField;
    ads1ModiyUser: TIntegerField;
    ads1ModiyTime: TDateTimeField;
    ads1MANU_PART_NUMBER: TStringField;
    ads1MANU_PART_DESC: TStringField;
    ads1EMPLOYEE_NAME: TStringField;
    edtFilter: TLabeledEdit;
    ads1Active: TIntegerField;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    mniSetActive: TMenuItem;
    mniView: TMenuItem;
    qrytmp: TADOQuery;
    mniUpImg: TMenuItem;
    btn1: TBitBtn;
    dlgOpen1: TOpenDialog;
    rb1: TRadioButton;
    rb2: TRadioButton;
    procedure btnExitClick(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure mniSetActiveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mniUpImgClick(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FHotColumn: TColumnEh;
    procedure GetmainData();
  end;

var
  Form1: TForm1;

implementation

uses
  DateUtils, wz_gunit, frmEdit;

{$R *.dfm}

procedure TForm1.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.eh1TitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;

if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
  Column.Title.SortMarker := smUpEh;
end
else
if Column.Title.SortMarker = smUpEh then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
  Column.Title.SortMarker := smDownEh;
end ;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  GetmainData;
  eh1TitleClick(eh1.Columns[0]);
end;

procedure TForm1.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(eh1.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint, ftAutoInc] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',gStrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TForm1.mniSetActiveClick(Sender: TObject);
var
  LRkey: Integer;
  LCmd: TADOCommand;
begin
  LRkey := ads1.fieldbyname('rkey').AsInteger;
  LCmd := TADOCommand.Create(Self);
  try
    LCmd.Connection := dm1.con1;
    LCmd.CommandText := 'UPDATE Print2D_CAM SET Active = 0 where D25_Ptr = ' + ads1.fieldbyname('d25_ptr').asstring;
    LCmd.Execute;

    LCmd.CommandText := 'UPDATE Print2D_CAM SET ACTIVE = 1 where rkey = ' + IntToStr(LRkey);
    LCmd.Execute;

    btnRefreshClick(btnRefresh);
    ads1.Locate('rkey',LRkey,[loCaseInsensitive]);
    ShowMessage('设置完毕');
  finally
    LCmd.free;
  end;
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
  ads1.Requery();
end;

procedure TForm1.pm1Popup(Sender: TObject);
begin
  mniSetActive.Enabled := not ads1.IsEmpty;
  mniView.Enabled := not ads1.IsEmpty;
  //mniUpImg.Enabled := gUser.User_Permit = '2';
end;

procedure TForm1.mniN1Click(Sender: TObject);
var
  Lfrm: TForm2;
  LGUID: TGUID;
begin
  Lfrm := TForm2.Create(Self);
  try
      qrytmp.Close;
    qrytmp.SQL.Text := 'SELECT * FROM Print2D_BarDef pm';
    qrytmp.Open;
    while not qrytmp.Eof do
    begin
      Lfrm.cbxTypeDef.Items.Add(qrytmp.fieldbyname('barname').AsString);
      qrytmp.Next;
    end;

    CreateGUID(LGUID);
    ads1.Append;
    ads1.FieldByName('IDKey').Value := GUIDToString(LGUID);
    Lfrm.ShowModal;

  finally
    if ads1.State in [dsEdit, dsInsert] then
      ads1.Cancel;
    Lfrm.Free;
  end;
end;

procedure TForm1.mniViewClick(Sender: TObject);
var
  Lfrm: TForm2;
  LGUID: TGUID;
begin
  Lfrm := TForm2.Create(Self);
  try
    //CreateGUID(LGUID);
    qrytmp.Close;
    qrytmp.SQL.Text := 'SELECT * FROM Print2D_BarDef pm';
    qrytmp.Open;
    while not qrytmp.Eof do
    begin
      Lfrm.cbxTypeDef.Items.Add(qrytmp.fieldbyname('barname').AsString);
      qrytmp.Next;
    end;
    Lfrm.edtBCBH.Text := ads1.fieldbyname('manu_part_number').AsString;
    //ads1.Append;
    //ads1.FieldByName('IDKey').Value := GUIDToString(LGUID);
    Lfrm.btnSave.Enabled := False;
    Lfrm.ShowModal;

  finally
    if ads1.State in [dsEdit, dsInsert] then
      ads1.Cancel;
    Lfrm.Free;
  end
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  ShowMessage('2权限可以上传图片');
end;

procedure TForm1.mniUpImgClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    ads1.Edit;
    TBlobField(ads1.FieldByName('CamImg')).LoadFromFile(dlgOpen1.FileName);
    ads1.Post;
  end;
end;

procedure TForm1.GetmainData;
begin
  ads1.close;
  if rb1.Checked then
    ads1.Parameters.ParamByName('p1').Value := 1
  else
    ads1.Parameters.ParamByName('p1').Value := 0;
  ads1.open;
end;

procedure TForm1.rb2Click(Sender: TObject);
begin
  GetmainData;
end;

end.
