unit uBaseSinglePickListFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls, EhLibVCL;

type
  TfrmSinglePickList = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edtFilter: TLabeledEdit;
    btnOK: TButton;
    eh1: TDBGridEh;
    cdsPick: TClientDataSet;
    dsPick: TDataSource;
    btnCancelPick: TButton;
    procedure eh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelPickClick(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FMainSql: string;
    procedure AddColumWithStr(AStr: string);
  public
    { Public declarations }
    FHotColumn: TColumnEh;
    function InitWithPickID(AModID,APickID: Integer;AWhere: string = ''): Boolean;
  end;

implementation

uses
  uCommFunc, System.StrUtils;

{$R *.dfm}

{ TfrmSinglePickList }


{ TfrmSinglePickList }

procedure TfrmSinglePickList.AddColumWithStr(AStr: string);
var
  i,j,k,TotalWidth,ColWidth:integer;
  Left_str,right_str,FieldName,FieldCaption,TmpStr:string;
  NewColumn:TColumnEh;
begin
  TotalWidth:=0;
  while AStr <> '' do begin
    //从字段信息串中获取每个字段名称以及显示caption
    i:= Pos(',',AStr);
    if i > 0 then //找到了字段分割符号
    begin
      left_str:= leftStr(AStr,i-1);     //获取第一个字段部分
      right_str:=rightStr(AStr,Length(AStr)-i);//获取除了第一个字段剩余部分
    end
    else
    begin
      left_str := AStr; //如果没有找到','
      right_str:='';
    end;

    j:=Pos('/',left_str);  //第一个'/'
    if j>0 then //如果有'/'分割符号，表示有效
    begin
      ColWidth := 0;
      FieldName:= leftstr(left_str,j-1);
//      FieldCaption:=rightbStr(left_str,Length(left_str)-j);
      TmpStr:=rightStr(left_str,Length(left_str)-j);
      k:= Pos('/',Tmpstr);     // 第二个'/'
      if K > 0 then  //存在字段宽度数据
      begin
        FieldCaption:=leftStr(Tmpstr,k-1);
        ColWidth := StrToInt(rightStr(Tmpstr,length(tmpstr)-k));
        TotalWidth := TotalWidth + ColWidth;
      end
      else
        FieldCaption:=Tmpstr;
      NewColumn:= eh1.Columns.Add;
      NewColumn.FieldName := FieldName;
      NewColumn.Title.Caption := FieldCaption;
      if ColWidth <> 0 then
        NewColumn.Width := ColWidth;
    end;
    AStr:= right_str;
  end;
//  if self.Width < TotalWidth +28 then
   self.width := TotalWidth + 100;
end;

procedure TfrmSinglePickList.btnCancelPickClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmSinglePickList.btnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmSinglePickList.edtFilterChange(Sender: TObject);
var
  LFilter: string;
begin
  if VarType(cdsPick.Data) = varEmpty then Exit;
  LFilter := Trim(edtFilter.Text);

  if FHotColumn = nil then
    FHotColumn := eh1.Columns[0];
  if Trim(LFilter) = '' then
  begin
    cdsPick.Filter := '';
    cdsPick.Filtered := False;
  end else
  begin
    if FHotColumn.Field.DataType in [ftString, ftWideString, ftMemo] then
    begin
      cdsPick.Filter := FHotColumn.FieldName + ' like ' + QuotedStr('%' + LFilter + '%');
      cdsPick.Filtered := True;
    end;// else
//    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftLargeint, ftAutoInc] then
//    begin
//      cdsPick.Filter := FHotColumn.FieldName + ' >= ' + LFilter;
//      cdsPick.Filtered := True;
//    end else
//    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
//    begin
//      cdsPick.Filter := FHotColumn.FieldName + ' >= ' + QuotedStr(LFilter);
//      cdsPick.Filtered := True;
//    end;
  end;
end;

procedure TfrmSinglePickList.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssAlt in Shift)  and  (Key=86) then
  begin
    showmessage(FMainSql);
  end;
end;

procedure TfrmSinglePickList.eh1TitleClick(Column: TColumnEh);
//var
//  LOP: TIndexOptions;
begin
  inherited;
  edtFilter.EditLabel.Caption := Column.Title.Caption;
  FHotColumn := Column;
//  if not Column.Field.IsBlob then { 不能给大二进制字段建立索引或排序 }
//  begin
//    if column.Title.SortMarker =smDownEh then
//    begin
//     column.Title.SortMarker:=smUpEh;
//     lop:=[];
//    end else
//    begin
//     column.Title.SortMarker:=smDownEh;
//     LOP := [ixDescending];
//    end;
//    cdsMain.IndexDefs.Update;
//    if cdsMain.IndexDefs.IndexOf('MainDefIndex') >= 0 then
//      cdsMain.DeleteIndex('MainDefIndex');
//    cdsMain.AddIndex('MainDefIndex', Column.FieldName, LOP, '');
//    cdsMain.IndexName := 'MainDefIndex';
//  end;
end;

function TfrmSinglePickList.InitWithPickID(AModID, APickID: Integer;AWhere: string = ''): Boolean;
var
  LCds: TClientDataSet;
begin
  Result := False;
  LCds := TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql('select * from Tier3_PickList where modid = ' + IntToStr(AModID) + ' and pickid=' + IntToStr(APickID),LCds) then
      Exit;
    if LCds.IsEmpty then
    begin
      ShowMessage('没有找到对应的pickid');
      Exit;
    end;
    Self.Caption := LCds.FieldByName('FormCaption').AsString;

    FMainSql := LCds.FieldByName('PickSql').AsString + ' ' + AWhere;

    if not gSvrIntf.IntfGetDataBySql(LCds.FieldByName('PickSql').AsString + ' ' + AWhere,cdsPick) then Exit;
    AddColumWithStr(LCds.FieldByName('FieldList').AsString);
    btnOK.Left := Self.Width div 3 - btnOK.Width div 2;
    btnCancelPick.Left := Self.Width div 3 * 2 - btnCancelPick.Width div 2;
    edtFilter.Left := Self.Width div 2 - edtFilter.Width div 2;
    eh1TitleClick(eh1.Columns[0]);
    Result := True;
  finally
    LCds.Free;
  end;
end;

end.
