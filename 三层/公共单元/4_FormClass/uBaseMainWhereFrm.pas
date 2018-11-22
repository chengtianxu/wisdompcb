unit uBaseMainWhereFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.DB, Datasnap.DBClient, Vcl.ExtCtrls, EhLibVCL;

type
  TfrmMainWhere = class(TfrmBase)
    pnlBackGround: TPanel;
    cdsDisplay: TClientDataSet;
    dsDisplay: TDataSource;
    ehDisplayWhere: TDBGridEh;
    btnClear: TButton;
    btnClose: TButton;
    btnOK: TButton;
    intgrfldMainWhereSeqNO: TIntegerField;
    strngfldMainWhereFieldCaption: TStringField;
    strngfldMainWhereFieldName: TStringField;
    intgrfldMainWhereDataType: TIntegerField;
    intgrfldMainWhereInputType: TIntegerField;
    intgrfldMainWherePickID: TIntegerField;
    strngfldMainWherePickRetFieldName: TStringField;
    strngfldMainWhereDropDownValues: TStringField;
    strngfldMainWhereOper: TStringField;
    strngfldMainWhereFieldValue: TStringField;
    cdsRet: TClientDataSet;
    strngfldRetFieldName: TStringField;
    strngfldRetOper: TStringField;
    strngfldRetFieldValue: TStringField;
    intgrfldRetSeqNo: TIntegerField;
    intgrfldDisplayModID: TIntegerField;
    intgrfldDisplayID: TIntegerField;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure cdsDisplayAfterScroll(DataSet: TDataSet);
    procedure strngfldMainWhereOperSetText(Sender: TField; const Text: string);
    procedure eh1Columns2EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    function StrToOper(AStr: string): string;
  public
    { Public declarations }
    function GetData(AModID,AID: Integer): Boolean;
    function GetRetWhereSql: string;
  end;

implementation

uses
  uCommFunc,System.StrUtils, uBaseSinglePickListFrm, uBaseBetweenFrm, System.DateUtils;

{$R *.dfm}

{ TfrmMainWhere }

procedure TfrmMainWhere.btnClearClick(Sender: TObject);
begin
  inherited;
  cdsDisplay.First;
  while not cdsDisplay.Eof do
  begin
    cdsDisplay.Edit;
    cdsDisplay.FieldByName('FieldValue').AsString := '';
    cdsDisplay.Post;
    cdsDisplay.Next;
  end;
end;

procedure TfrmMainWhere.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmMainWhere.btnDeleteClick(Sender: TObject);
begin
  inherited;
  cdsDisplay.Edit;
  cdsDisplay.FieldByName('FieldValue').AsString := '';
  cdsDisplay.Post;
end;

procedure TfrmMainWhere.btnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmMainWhere.cdsDisplayAfterScroll(DataSet: TDataSet);
var
  LStrArr1: TArray<string>;
  I: Integer;
begin
  inherited;
  ehDisplayWhere.Columns[2].PickList.Clear;
  ehDisplayWhere.Columns[1].PickList.Clear;
  case DataSet.FieldByName('datatype').AsInteger of
    0://数字
    begin
      ehDisplayWhere.Columns[1].PickList.add('等于');
      ehDisplayWhere.Columns[1].PickList.add('不等于');
      ehDisplayWhere.Columns[1].PickList.add('小于');
      ehDisplayWhere.Columns[1].PickList.add('小于等于');
      ehDisplayWhere.Columns[1].PickList.add('大于');
      ehDisplayWhere.Columns[1].PickList.add('大于等于');

      case DataSet.FieldByName('inputtype').AsInteger of
        0:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := False;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsNone;
        end;
        1:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := True;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsEllipsis;
        end;
        2:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := True;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsDropDown;
          LStrArr1 := cdsDisplay.FieldByName('DropDownValues').AsString.Split([';']);
          for I := 0 to Length(LStrArr1) - 1 do
          begin
            ehDisplayWhere.Columns[2].PickList.Add(LStrArr1[I]);
          end;
        end;
      end;
    end;
    1://字符
    begin
      ehDisplayWhere.Columns[1].PickList.add('相似');
      case DataSet.FieldByName('inputtype').AsInteger of
        0:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := False;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsNone;
        end;
        1:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := True;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsEllipsis;
        end;
        2:
        begin
          ehDisplayWhere.Columns[2].ReadOnly := True;
          ehDisplayWhere.Columns[2].ButtonStyle := cbsDropDown;
          LStrArr1 := cdsDisplay.FieldByName('DropDownValues').AsString.Split([';']);
          for I := 0 to Length(LStrArr1) - 1 do
          begin
            ehDisplayWhere.Columns[2].PickList.Add(LStrArr1[I]);
          end;
        end;
      end;

    end;
    2://日期
    begin
      ehDisplayWhere.Columns[1].PickList.add('区间');
      ehDisplayWhere.Columns[2].ReadOnly := True;
      ehDisplayWhere.Columns[2].ButtonStyle := cbsEllipsis;
    end;
  end;
end;

procedure TfrmMainWhere.eh1Columns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  LFrm: TfrmSinglePickList;
  LFrmBetween: TfrmBaseBetween;
  LStrArr: TArray<string>;
  LSvrDatetime: TDateTime;
begin
  Handled := True;

  if cdsDisplay.FieldByName('Datatype').AsInteger = 2 then
  begin
    LSvrDatetime := gFunc.GetSvrDateTime;
    LFrmBetween := TfrmBaseBetween.Create(Self);
    try
      if cdsDisplay.FieldByName('fieldvalue').AsString = '' then
      begin
        LFrmBetween.dtp1.Date :=  DateOf(IncDay(LSvrDateTime,-7));
        LFrmBetween.dtp2.Date := DateOf(LSvrDateTime);
      end else
      begin
        LStrArr := cdsDisplay.FieldByName('fieldvalue').AsString.Split([' AND '],ExcludeEmpty);

        LFrmBetween.dtp1.Datetime := gFunc.StrToDateTime(LStrArr[0]);
        LFrmBetween.dtp2.DateTime := gFunc.StrToDateTime(LStrArr[1]);
      end;
      if LFrmBetween.ShowModal = mrOk then
      begin
        cdsDisplay.Edit;
        cdsDisplay.FieldByName('fieldvalue').AsString := gFunc.DateTimeToStr(LFrmBetween.dtp1.DateTime) +
          ' AND ' + gFunc.DateTimeToStr(LFrmBetween.dtp2.DateTime);
        cdsDisplay.Post;
      end;
    finally
      LFrmBetween.Free;
    end;
  end else
  begin
    //0输入，1对话框挑选，2下拉选择
    case cdsDisplay.FieldByName('InputType').AsInteger of
      0:
      begin

      end;
      1:
      begin
        if (cdsDisplay.FieldByName('PickID').AsString <> '') and (cdsDisplay.FieldByName('PickRetFieldName').AsString <> '') then
        begin
          LFrm := TfrmSinglePickList.Create(Self);
          try
            LFrm.InitWithPickID(cdsDisplay.FieldByName('modid').AsInteger,cdsDisplay.FieldByName('pickid').AsInteger);
            if LFrm.ShowModal = mrOk then
            begin
              cdsDisplay.Edit;
              cdsDisplay.FieldByName('fieldvalue').AsString := LFrm.cdsPick.FieldByName(cdsDisplay.FieldByName('PickRetFieldName').AsString).AsString;
              cdsDisplay.Post;
            end;
          finally
            LFrm.Free;
          end;
        end;
      end;
      2:
      begin
        ehDisplayWhere.Columns[2].ReadOnly := False;
        ehDisplayWhere.Columns[2].DropDown;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmMainWhere.FormCreate(Sender: TObject);
begin
  inherited;
  cdsRet.CreateDataSet;
  cdsDisplay.CreateDataSet;
//  eh1.Columns[1].KeyList.add('等于');
//  eh1.Columns[1].KeyList.add('不等于');
//  eh1.Columns[1].KeyList.add('小于');
//  eh1.Columns[1].KeyList.add('小于等于');
//  eh1.Columns[1].KeyList.add('大于');
//  eh1.Columns[1].KeyList.add('大于等于');
//  eh1.Columns[1].KeyList.add('相似');
//  eh1.Columns[1].KeyList.add('区间');
//
//  eh1.Columns[1].KeyList.add('=');
//  eh1.Columns[1].KeyList.add('<>');
//  eh1.Columns[1].KeyList.add('<');
//  eh1.Columns[1].KeyList.add('<=');
//  eh1.Columns[1].KeyList.add('>');
//  eh1.Columns[1].KeyList.add('>=');
//  eh1.Columns[1].KeyList.add('like');
//  eh1.Columns[1].KeyList.add('Between');
end;


function TfrmMainWhere.GetData(AModID, AID: Integer): Boolean;
var
  LCds: TClientDataSet;
  LField,LField2: TField;
begin
  //Result := False;
  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql('select * from tier3_MainWhere where modid = ' + IntToStr(AModID) + ' and ID = ' + IntToStr(AID),LCds) then
    begin
      while not LCds.Eof do
      begin
        cdsDisplay.Append;
        for LField in cdsDisplay.Fields do
        begin
          LField2 := LCds.FindField(LField.FieldName);
          if LField2 <> nil then
          begin
            LField.Value := LField2.Value;
          end;
        end;

        case LCds.FieldByName('DataType').AsInteger of
          0: cdsDisplay.FieldByName('Oper').AsString := '等于';
          1: cdsDisplay.FieldByName('Oper').AsString := '相似';
          2: cdsDisplay.FieldByName('Oper').AsString := '区间';
        end;

        cdsDisplay.Post;
        LCds.Next;
      end;
      if not cdsRet.IsEmpty then
      begin
        cdsRet.First;
        while not cdsRet.Eof do
        begin
          if cdsDisplay.Locate('SeqNo;FieldName',VarArrayOf([cdsRet.FieldByName('SeqNo').AsInteger,cdsRet.FieldByName('FieldName').AsString]),[loCaseInsensitive]) then
          begin
            cdsDisplay.Edit;
            cdsDisplay.FieldByName('Oper').Value := cdsRet.FieldByName('Oper').Value;
            cdsDisplay.FieldByName('FieldValue').Value := cdsRet.FieldByName('FieldValue').Value;
            cdsDisplay.Post;
          end;
          cdsRet.Next;
        end;
      end;
    end;
    Result := True;
  finally
    LCds.Free;
  end;
  cdsDisplay.First;
  cdsDisplayAfterScroll(cdsDisplay);
end;

function TfrmMainWhere.GetRetWhereSql: string;
var
  LStrArr: TArray<string>;
  LValue: string;
begin
  cdsDisplay.First;
  while not cdsDisplay.Eof do
  begin
    if Trim(cdsDisplay.FieldByName('FieldValue').AsString) <> '' then
    begin
      if cdsRet.Locate('SeqNo;FieldName',VarArrayOf([cdsDisplay.FieldByName('SeqNo').AsInteger,cdsDisplay.FieldByName('FieldName').AsString]),[loCaseInsensitive]) then
      begin
        cdsRet.Edit;
        cdsRet.FieldByName('Oper').Value := cdsDisplay.FieldByName('Oper').AsString;
        cdsRet.FieldByName('FieldValue').Value := cdsDisplay.FieldByName('FieldValue').AsString;
        cdsRet.Post;
      end else
      begin
        cdsRet.Append;
        cdsRet.FieldByName('SeqNo').Value := cdsDisplay.FieldByName('SeqNo').AsString;
        cdsRet.FieldByName('FieldName').Value := cdsDisplay.FieldByName('FieldName').AsString;
        cdsRet.FieldByName('Oper').Value := cdsDisplay.FieldByName('Oper').AsString;
        cdsRet.FieldByName('FieldValue').Value := cdsDisplay.FieldByName('FieldValue').AsString;
        cdsRet.Post;
      end;
      if Result = '' then
        Result := ' and ' + Result
      else
        Result := Result + ' and ';
      Result := Result + cdsDisplay.FieldByName('fieldname').AsString + ' ' + StrToOper(cdsDisplay.FieldByName('Oper').AsString) + ' ';

      LValue := cdsDisplay.FieldByName('fieldvalue').AsString;

      if (cdsDisplay.FieldByName('datatype').AsInteger =0) then //数字
      begin
        if cdsDisplay.FieldByName('inputtype').AsInteger = 2 then
        begin
          LStrArr := LValue.Split([',']);
          LValue := LStrArr[0];
        end;
        Result := Result + LValue;
      end else
      if (cdsDisplay.FieldByName('datatype').AsInteger =1) then //字符
      begin
        if cdsDisplay.FieldByName('inputtype').AsInteger = 2 then
        begin
          LStrArr := LValue.Split([',']);
          LValue := LStrArr[0];
        end;
        Result := Result + QuotedStr('%' + LValue + '%');
      end else
      if (cdsDisplay.FieldByName('datatype').AsInteger =2) then //日期
      begin
        LStrArr := LValue.Split([' AND '],ExcludeEmpty);
        Result := Result + QuotedStr(LStrarr[0]) + ' AND ' + QuotedStr(LStrArr[1]);
      end;
    end;
    cdsDisplay.Next;
  end;

end;

procedure TfrmMainWhere.strngfldMainWhereOperSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  if AnsiIndexText(Text,['等于','不等于','小于','小于等于','大于','大于等于','相似','区间']) <> -1 then
    Sender.AsString := Text;
end;

function TfrmMainWhere.StrToOper(AStr: string): string;
begin
  if AStr = '等于' then
    Result := '=';
  if AStr = '不等于' then
    Result := '<>';
  if AStr = '小于' then
    Result := '<';
  if AStr = '小于等于' then
    Result := '<=';
  if AStr = '大于' then
    Result := '>';
  if AStr = '大于等于' then
    Result := '>=';
  if AStr = '相似' then
    Result := 'like';
  if AStr = '区间' then
    Result := 'Between';

end;

end.
