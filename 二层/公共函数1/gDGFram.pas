{*******************************************************}
{                                                       }
{       通用DBGrid框架                                  }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-20 9:36:22                        }
{                                                       }
{*******************************************************}

//Delphi 2010
//EH Ver 5.2.84
unit gDGFram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GridsEh, DBGridEh, Buttons, DB,
  DBClient, Menus, ComCtrls, DBGridEhGrouping, EhLibCDS;

type
  TFieldVisble = record
    FieldName: string;
    FieldCaption: string;
    FieldWidth: Integer;
  end;

  TOnGetData = function (AWHERE: string): OleVariant of object;

  TGetDataThread = class(TThread)
  private
    FEvent: TOnGetData;
    FWhere: string;
    FRet: OleVariant;
  protected
    procedure Execute;override;
  public
    constructor Create(AEvent: TOnGetData; AWhere: string);
    property Ret: OleVariant  read FRet;
  end;

  TdgF = class(TFrame)
    pnl1: TPanel;
    pnl2: TPanel;
    btnExit: TBitBtn;
    btnFresh: TBitBtn;
    btnExpToExcel: TBitBtn;
    btnSelect: TBitBtn;
    btnFieldShow: TBitBtn;
    dgF: TDBGridEh;
    bvl1: TBevel;
    edtFilter: TLabeledEdit;
    cdsF: TClientDataSet;
    dsF: TDataSource;
    pmZD: TPopupMenu;
    stat1: TStatusBar;
    procedure btnExitClick(Sender: TObject);
    procedure btnFreshClick(Sender: TObject);
    procedure btnExpToExcelClick(Sender: TObject);
    procedure dgFTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure DSAfterOpen(DataSet: TDataSet);
    procedure btnFieldShowClick(Sender: TObject);
    procedure DSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DSAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FFilterS: string;
    FFilterField: string;
    FOnGetData: TOnGetData;
    FFieldArr: array of TFieldVisble;
    FBCustomTitleClick: Boolean;
    procedure OnZDItemClick(Sender: TObject);
    procedure LoopPB(APB: TProgressBar; AFrom, AMax: Integer);
    procedure SetFieldVisible;
  public
    procedure SetField(ArrField: array of TFieldVisble);
    property FilterS: string read FFilterS write FFilterS;
  published
    property GetData: TOnGetData read FOnGetData write FOnGetData;

    { Public declarations }
  end;

implementation

uses
  gFun, gFilterFrm, ActiveX;

{$R *.dfm}

procedure TdgF.btnExitClick(Sender: TObject);
begin
  TControl(Owner).Perform(WM_CLOSE,0,0);
end;

procedure TdgF.btnExpToExcelClick(Sender: TObject);
begin
  DSExportTOEXCEL(dgF.DataSource.DataSet);
end;

procedure TdgF.btnFieldShowClick(Sender: TObject);
begin
  pmZD.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TdgF.btnFreshClick(Sender: TObject);
var
  LThread: TGetDataThread;
  LPB: TProgressBar;
  tmp: OleVariant;
begin
  if Assigned(FOnGetData) then
  begin
    Self.Enabled := False;
    LPB := TProgressBar.Create(Self);
    LPB.Parent := stat1;
    LPB.Left := 200;
    LPB.Width := 300;
    LPB.Show;
    LThread := TGetDataThread.Create(FOnGetData, FFilterS);
    try
      while not LThread.Terminated do
      begin
        LoopPB(LPB,1,400);
        Sleep(20);
        Application.ProcessMessages;
      end;
      tmp := LThread.Ret;
    finally
      LThread.Free;
      LPB.Free;
      Self.Enabled := True;
    end;
  end;
  SetFieldVisible;
  dgF.DataSource.DataSet.AfterOpen := DSAfterOpen;
  dgF.DataSource.DataSet.AfterScroll := DSAfterScroll;
  dgF.DataSource.DataSet.OnFilterRecord := DSFilterRecord;
  TClientDataSet(dgF.DataSource.DataSet).Data := tmp;
  dgF.DataSource.DataSet.Filtered := True;

end;

procedure TdgF.DSAfterOpen(DataSet: TDataSet);
var
  LCum: TColumnEh;
  LItem: TMenuItem;
  I: Integer;
  //B: Boolean;
begin
  pmZD.Items.Clear;
  //B := False;
  for I := 0 to dgF.Columns.Count - 1 do
  begin
    LCum := dgF.Columns[I];
    if LCum.Visible then
    begin
      LCum.Title.TitleButton := True;
      LItem := TMenuItem.Create(pmZD);
      LItem.Caption := LCum.Title.Caption;
      LItem.Checked := LCum.Visible;
      LItem.OnClick := OnZDItemClick;
      LItem.Tag := LCum.Index;
      pmZD.Items.Add(LItem);
      if not FBCustomTitleClick then dgFTitleClick(LCum);
      //B := True;
    end;
  end;
end;

procedure TdgF.DSAfterScroll(DataSet: TDataSet);
begin
  stat1.Panels[1].Text := IntToStr(DataSet.RecordCount);
end;

procedure TdgF.DSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if Length(Trim(edtFilter.Text)) <> 0 then
    Accept := Pos(UpperCase(edtFilter.Text), UpperCase(DataSet.FieldByName(FFilterField).AsString)) > 0;
end;

procedure TdgF.dgFTitleClick(Column: TColumnEh);
begin
  FBCustomTitleClick := True;
  edtFilter.EditLabel.Caption := Column.Title.Caption;
  FFilterField := Column.FieldName;
end;

procedure TdgF.edtFilterChange(Sender: TObject);
begin
  dgF.DataSource.DataSet.Filtered := False;
  dgF.DataSource.DataSet.Filtered := True;
end;


procedure TdgF.LoopPB(APB: TProgressBar; AFrom, AMax: Integer);
begin
  APB.Max := AMax;
  APB.Min := AFrom;
  if APB.Position < AMax then
  begin
    if APB.Position >= AFrom then
    begin
      APB.Position := APB.Position + 1;
    end else
      APB.Position := AFrom;
  end else
    APB.Position := AFrom;
end;

procedure TdgF.OnZDItemClick(Sender: TObject);
var
  LItem: TMenuItem;
begin
  LItem := (Sender as TMenuItem);
  LItem.Checked := not LItem.Checked;
  dgF.Columns[LItem.Tag].Visible := LItem.Checked;
end;


procedure TdgF.SetField(ArrField: array of TFieldVisble);
var
  I: Integer;
begin
  SetLength(FFieldArr,Length(ArrField));
  for I := 0 to Length(FFieldArr) - 1 do
    FFieldArr[I] := ArrField[I];
end;

procedure TdgF.SetFieldVisible;
var
  I: Integer;
  B: Boolean;
  tmpDS: TDataSet;
  LCol: TColumnEh;
  J: Integer;
begin
  tmpDS := dgF.DataSource.DataSet;
  dgF.DataSource.DataSet := nil;
  //dgF.Columns.Clear;
  for I := Low(FFieldArr) to High(FFieldArr) do
  begin
    B := False;
    for J := 0 to dgf.Columns.Count - 1 do
    begin
      if dgF.Columns[J].FieldName = FFieldArr[I].FieldName then
      begin
        if dgF.Columns[J].Index <> I then dgF.Columns[J].Index := I;
        dgF.Columns[J].Width := FFieldArr[I].FieldWidth;
        if FFieldArr[I].FieldCaption <> '' then
          dgF.Columns[J].Title.Caption := FFieldArr[I].FieldCaption
        else
          dgF.Columns[J].Title.Caption := FFieldArr[I].FieldName;
        B := True;
        Break;
      end;
    end;
    if not B then
    begin
      LCol := dgF.Columns.Add;
      LCol.FieldName := FFieldArr[I].FieldName;
      LCol.Width := FFieldArr[I].FieldWidth;
      if FFieldArr[I].FieldCaption <> '' then
        LCol.Title.Caption := FFieldArr[I].FieldCaption
      else
        LCol.Title.Caption := FFieldArr[I].FieldName;
      LCol.Index := I;
    end;
  end;
  if Length(FFieldArr) > 0 then
    while dgF.Columns.Count > Length(FFieldArr) do
      dgF.Columns.Delete(dgF.Columns.Count - 1);
//  for I := High(FFieldArr)+1 to dgF.Columns.Count - 1 do
//    dgF.Columns.Delete(I);
  dgF.DataSource.DataSet := tmpDS;

  {
  for I := 0 to dgF.Columns.Count - 1 do
    for J := Low(FFieldArr) to High(FFieldArr) do
      if UpperCase(dgF.Columns[I].FieldName) = UpperCase(FFieldArr[J].FieldName) then
        dgF.Columns[i].Index := J;
  for I := 0 to dgF.Columns.Count - 1 do
  begin
    B := False;
    for J := Low(FFieldArr) to High(FFieldArr) do
    begin
      if UpperCase(dgF.Columns[I].FieldName) = UpperCase(FFieldArr[J].FieldName) then
      begin
        B := True;

        if (FFieldArr[J].FieldCaption <> '') and (dgF.Columns[I].Title.Caption <> FFieldArr[J].FieldCaption) then
          dgF.Columns[I].Title.Caption := FFieldArr[J].FieldCaption;
        if (FFieldArr[J].FieldWidth <> 0) and (FFieldArr[J].FieldWidth <>dgF.Columns[I].Width) then
          dgF.Columns[I].Width := FFieldArr[J].FieldWidth;
      end;
    end;
    dgF.Columns[I].Visible := B;
  end;
  DSAfterOpen(dgF.DataSource.DataSet);
  dgF.DataSource.DataSet.Filtered := True;

  }
end;

{ TGetDataThread }

constructor TGetDataThread.Create(AEvent: TOnGetData; AWhere: string);
begin
  FEvent := AEvent;
  FWhere := AWhere;
  inherited Create(False);
end;

procedure TGetDataThread.Execute;
begin
  inherited;
  CoInitialize(nil);
  FreeOnTerminate := False;
  try
    if Assigned(FEvent) then FRet := FEvent(FWhere);
  finally
    Terminate;
    CoUninitialize;
  end;
end;

end.
