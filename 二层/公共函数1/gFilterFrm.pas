{*******************************************************}
{                                                       }
{       Fram调用条件设置窗体                            }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-20 9:35:38                        }
{                                                       }
{*******************************************************}


unit gFilterFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBGridEh, Buttons, DB;

type
  TfrmFilter = class(TForm)
    pnl2: TPanel;
    rgSign: TRadioGroup;
    btnAdd: TButton;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    pnl3: TPanel;
    lbl1: TLabel;
    lvRet: TListView;
    pnl4: TPanel;
    lvField: TListView;
    lbl2: TLabel;
    grp1: TGroupBox;
    pgc1: TPageControl;
    tsStr: TTabSheet;
    tsFloat: TTabSheet;
    lbl4: TLabel;
    tsInt: TTabSheet;
    edtInt: TLabeledEdit;
    edtStr: TLabeledEdit;
    edtFLoat: TLabeledEdit;
    tsDate: TTabSheet;
    lbl3: TLabel;
    lbl5: TLabel;
    lblData: TLabel;
    dtpFromData: TDateTimePicker;
    dtpFromTime: TDateTimePicker;
    dtpToDate: TDateTimePicker;
    dtpToTime: TDateTimePicker;
    procedure lvFieldChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnAddClick(Sender: TObject);
    procedure lvRetDeletion(Sender: TObject; Item: TListItem);
    procedure edtIntKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lvFieldDeletion(Sender: TObject; Item: TListItem);
  private
    { Private declarations }

    function GetFilterS: string;
  public
    { Public declarations }
  end;

  TFilterField = record
    FieldName: string;
    DisplayText: string;
    TableFieldName: string;
  end;

  TDataClass = class
  public
    Field: TField;
    TableFieldName: string;
  end;

function ShowFilterFrm(dbGrd: TDBGridEh; out outFilerS: string; AFieldArr: array of TFilterField): Boolean;

implementation

uses
  gFun, DateUtils;

{$R *.dfm}
function ShowFilterFrm(dbGrd: TDBGridEh; out outFilerS: string; AFieldArr: array of TFilterField): Boolean;
var
  frmFilter: TfrmFilter;
  I: Integer;
  tmpS: string;
  J: Integer;
  tmpData: TDataClass;
begin
  frmFilter := TfrmFilter.Create(dbGrd);
  with frmFilter do
  begin
    try
      for I := 0 to dbGrd.Columns.Count - 1 do
      begin
        if dbGrd.Columns[I].Field.DataType in
          [ftSmallint,ftInteger,ftWord,ftBytes,ftLargeint,ftLongWord,
          ftShortint,ftByte,ftString,ftWideString,ftReference,ftFixedWideChar,ftWideMemo,
          ftMemo,ftFixedChar,ftFloat,ftCurrency,ftExtended,ftDate, ftTime, ftDateTime]
        then
        begin
          tmpS := dbGrd.Columns[I].Title.Caption;
          for J := Length(tmpS) downto 1 do
          begin
            if tmpS[J] = '|' then
              tmpS := Copy(tmpS,J+1,Length(tmpS)-J);
          end;
          for J := 0 to Length(AFieldArr) - 1 do
          begin
            if AFieldArr[J].FieldName = dbGrd.Columns[I].FieldName then
            begin
              if not StrIsNull(AFieldArr[J].DisplayText) then
                tmpS := AFieldArr[J].DisplayText;
              tmpData := TDataClass.Create;
              tmpData.Field := dbGrd.Columns[I].Field;
              if StrIsNull(AFieldArr[J].TableFieldName) then
                tmpData.TableFieldName := dbGrd.Columns[I].FieldName
              else
               tmpData.TableFieldName := AFieldArr[J].TableFieldName;

              lvField.AddItem(tmpS,tmpData);
            end;
          end;
        end;
      end;
      if lvField.Items.Count <> 0 then lvField.ItemIndex := 0;
      Result := ShowModal = mrOk;
      if Result then
        outFilerS := GetFilterS;
    finally
      FreeAndNil(frmFilter);
    end;
  end;
end;

procedure TfrmFilter.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFilter.btn2Click(Sender: TObject);
begin
  lvRet.DeleteSelected;
end;

procedure TfrmFilter.btn3Click(Sender: TObject);
begin
  lvRet.Clear;
end;

procedure TfrmFilter.btn4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFilter.btnAddClick(Sender: TObject);
  function GetSign: string;
  begin
    case rgSign.ItemIndex of
      0: Result := ' = ';
      1: Result := ' > ';
      2: Result := ' < ';
      3: Result := ' <> ';
    else
      Result := ' = ';
    end;
  end;
var
  LItem: TListItem;
  ch: PChar;
  tmpS: string;
begin
  if lvField.Selected = nil then Exit;

  LItem := lvRet.Items.Add;
  LItem.Caption := lvField.Selected.Caption;
  case pgc1.ActivePageIndex of
    0: //Int
    begin
      try
        StrToInt(edtInt.Text);
      except
        ShowMessage(LoadStr(48));
        lvRet.Items.Delete(lvRet.Items.IndexOf(LItem));
        Exit;
      end;
      LItem.SubItems.Add(edtInt.Text);
      tmpS := '(' + TDataClass(lvField.Selected.Data).TableFieldName + GetSign + LItem.SubItems[0] + ')';
      ch := GetMemory(512);
      StrCopy(ch,PChar(tmpS));
      LItem.Data := ch;
    end;
    1: //string
    begin
      if StrIsNull(edtStr.Text) then
      begin
        ShowMessage(LoadStr(48));
        lvRet.Items.Delete(lvRet.Items.IndexOf(LItem));
        Exit;
      end;
      LItem.SubItems.Add(edtStr.Text);
      tmpS := '(' + TDataClass(lvField.Selected.Data).TableFieldName + ' LIKE ' + QuotedStr('%'+LItem.SubItems[0]+'%') + ')';
      ch := GetMemory(512);
      StrCopy(ch,PChar(tmpS));
      LItem.Data := ch;
    end;
    2: //Float
    begin
      try
        StrToFloat(edtFLoat.Text);
      except
        ShowMessage(LoadStr(48));
        lvRet.Items.Delete(lvRet.Items.IndexOf(LItem));
        Exit;
      end;
      LItem.SubItems.Add(edtFLoat.Text);
      tmpS := '(' + TDataClass(lvField.Selected.Data).TableFieldName + GetSign + LItem.SubItems[0] + ')';
      ch := GetMemory(512);
      StrCopy(ch,PChar(tmpS));
      LItem.Data := ch;
    end;
    3: //Datetime
    begin
      tmpS := QuotedStr(gDateTimeToStr(DateOf(dtpFromData.Date)+Timeof(dtpFromTime.Time))) +
        ' AND ' + QuotedStr(gDateTimeToStr(DateOf(dtpToDate.Date) + TimeOf(dtpToTime.Time))) ;
      LItem.SubItems.Add(tmpS);
      tmpS := '(' + TDataClass(lvField.Selected.Data).TableFieldName + ' BETWEEN ' + LItem.SubItems[0] + ')';
      ch := GetMemory(512);
      StrCopy(ch,PChar(tmpS));
      LItem.Data := ch;
    end;
  end;
end;

procedure TfrmFilter.edtIntKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9', #8, #13,#9]) then
  begin
    Key := #0;
    ShowMessage(LoadStr(16));
  end;
end;

procedure TfrmFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAddClick(btnAdd);
end;

function TfrmFilter.GetFilterS: string;
var
  LItem: TListItem;
  tmpS: string;
begin
  for LItem in lvRet.Items do
  begin
    if LItem.Data <> nil then
      tmpS := PChar(LItem.Data);
    if Length(Result) <> 0 then
      Result := Result + ' AND ' + tmpS
    else
      Result := tmpS;
  end;
end;

procedure TfrmFilter.lvRetDeletion(Sender: TObject; Item: TListItem);
begin
  FreeMem(Item.Data,512);
end;

procedure TfrmFilter.lvFieldChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  LType: TFieldType;
begin
  if (Item.Data <> nil) and (lvField.Selected <> nil) then
  begin
    LType := TDataClass(Item.Data).Field.DataType;
    case LType of
      //int
      ftSmallint,ftInteger,ftWord,ftBytes,ftLargeint,ftLongWord,
      ftShortint,ftByte:
      begin
        pgc1.ActivePage := tsInt;
        pgc1.ActivePageIndex := tsInt.PageIndex;
        edtInt.EditLabel.Caption := lvField.Selected.Caption;
        rgSign.Visible := True;
      end;
      //string
      ftString,ftWideString,ftReference,ftFixedWideChar,ftWideMemo,
      ftMemo,ftFixedChar:
      begin
        pgc1.ActivePage := tsStr;
        pgc1.ActivePageIndex := tsStr.PageIndex;
        edtStr.EditLabel.Caption := lvField.Selected.Caption;
        rgSign.Visible := False;
      end;
      //float
      ftFloat,ftCurrency,ftExtended:
      begin
        pgc1.ActivePage := tsFloat;
        pgc1.ActivePageIndex := tsFloat.PageIndex;
        edtFLoat.EditLabel.Caption := lvField.Selected.Caption;
        rgSign.Visible := True;
      end;
      //Datetime
      ftDate, ftTime, ftDateTime:
      begin
        pgc1.ActivePage := tsDate;
        pgc1.ActivePageIndex := tsDate.PageIndex;
        lblData.Caption := lvField.Selected.Caption;
        rgSign.Visible := False;
        dtpFromData.DateTime := IncWeek(Now,-1);
        dtpFromTime.DateTime := 0;
        dtpToDate.DateTime := Now;
        dtpToTime.DateTime := 0;
      end;
    end;
  end;
end;

procedure TfrmFilter.lvFieldDeletion(Sender: TObject; Item: TListItem);
begin
  TDataClass(Item.Data).Free;
end;

end.
