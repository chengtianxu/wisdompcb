unit TagCompareFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, DB, ADODB;

type
  TfrmBarComp = class(TForm)
    edt1: TEdit;
    mmo1: TMemo;
    cbVPO: TCheckBox;
    cbHWCode: TCheckBox;
    cbQty: TCheckBox;
    edtVPO: TEdit;
    lblQty: TLabel;
    lblkhxh: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbManualVPO: TCheckBox;
    cbxVer: TCheckBox;
    lblVer: TLabel;
    ads737: TADODataSet;
    btn1: TButton;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    FOurBarID: string;
    procedure DecodeBarCode(AStr: string);
    function GetCheckCount: Integer;
    function CompareCode: Boolean;
  public
    { Public declarations }
  end;


  procedure ShowFrmbarComp(AOwner: TComponent);
implementation

uses
  DM, MMSystem, Math, WZ_gUnit, CmpHisFrm;

{$R *.dfm}

procedure ShowFrmbarComp(AOwner: TComponent);
begin
  with TfrmBarComp.Create(AOwner) do
  begin
    ShowModal;
    Free;
  end;
end;

function TfrmBarComp.CompareCode: Boolean;
var
  LS: TStringList;
  I: Integer;
  n: Integer;
begin
  n := 0;
  LS := TStringList.Create;
  try
    if cbVPO.Checked then LS.Add(edtVPO.Text);
    if cbHWCode.Checked then LS.Add(lblkhxh.Caption);
    if cbQty.Checked then LS.Add(lblQty.Caption);
    if cbxVer.Checked then LS.Add(lblVer.Caption);
    for I := 0 to mmo1.Lines.Count - 1 do
      if LS.IndexOf(mmo1.Lines[I]) <> -1 then
      begin
        LS.Delete(LS.IndexOf(mmo1.Lines[I]));
        Inc(n);
      end;
    Result := n = mmo1.Lines.Count;
  finally
    LS.Free;
  end;
end;

procedure TfrmBarComp.DecodeBarCode(AStr: string);
var
  BarInfo: TBarInfo;
begin
  BarInfo := dm1.GetBarInfo(AStr);
  edtVPO.Text := BarInfo.VPO;
  lblkhxh.Caption := BarInfo.HWCode;
  lblQty.Caption := IntToStr(BarInfo.Qty);
  lblVer.Caption := BarInfo.Ver;//Trim(BarInfo.HWCode)[Length(Trim(BarInfo.HWCode))];
end;

procedure TfrmBarComp.edt1KeyPress(Sender: TObject; var Key: Char);
  function IsOurBarCode(AStr: string): Boolean;
  begin
    Result := (dm1.GetBarType(AStr) = btHW) or (dm1.GetBarType(AStr) = btHWZD);
  end;
var
  I: Integer;
  LNowTime: TDateTime;
  LS: TStringList;
begin
  dm1.OpenQry('select getdate() as NowTime');
  LNowTime := dm1.qry1.fieldbyname('NowTime').AsDateTime;
  lbl2.Caption := '';
  if Key = #13 then
  begin
    if IsOurBarCode(edt1.Text) then
    begin
      FOurBarID := edt1.Text;
      DecodeBarCode(edt1.Text);
    end
    else
      mmo1.Lines.Add(edt1.Text);
    edt1.Text := '';
    Key := #0;
  end;
  if mmo1.Lines.Count >=  GetCheckCount then
  begin
    ads737.Close;
    ads737.Open;
    ads737.Append;
    ads737.FieldByName('ourBarID').AsString := FOurBarID;
    LS := TStringList.Create;
    try
      if cbVPO.Checked then LS.Add('HWPONumber');
      if cbHWCode.Checked then LS.Add('HWCode');
      if cbQty.Checked then LS.Add('HWNumber');
      if cbxVer.Checked then LS.Add('HWVer');
      for I := 0 to mmo1.Lines.Count - 1 do
      begin
        if LS[I] = 'HWNumber' then
        begin
          ads737.FieldByName(LS[I]).AsInteger := StrToIntDef(mmo1.Lines[I],0);
        end else
          ads737.FieldByName(LS[I]).AsString := mmo1.Lines[I];
      end;
    finally
      LS.Free;
    end;
    ads737.FieldByName('cmpDate').AsDateTime := LNowTime;
    ads737.FieldByName('cmpUser').AsString := gUser.User_Ptr;
    if not CompareCode then
    begin
      ads737.FieldByName('cmpRet').AsInteger := 0;
      try
        sndPlaySound('ERROR.wav',SND_ASYNC);
      except
      end;
      lbl2.Caption := '≤ª∆•≈‰';
    end else
    begin
      ads737.FieldByName('cmpRet').AsInteger := 1;
      lbl2.Caption := 'PASS';
      try
        sndPlaySound('PASS.wav',SND_ASYNC);
      except
      end;
    end;
    ads737.Post;
    mmo1.Lines.Clear;
  end;
end;

function TfrmBarComp.GetCheckCount: Integer;
begin
  Result := 0;
  if cbVPO.Checked  then
    Inc(Result);
  if cbHWCode.Checked then
    Inc(Result);
  if cbQty.Checked then
    Inc(Result);
  if cbxVer.Checked then
    Inc(Result);
end;

procedure TfrmBarComp.btn1Click(Sender: TObject);
begin
  with TfrmCmpHis.Create(Self) do
  begin
    try
      ShowModal;
    finally
      free;
    end;
  end;
end;


end.
