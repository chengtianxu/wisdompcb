unit MutiAddCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, StdCtrls, ExtCtrls, ADODB, Buttons;

type
  TfrmMutiAddCard = class(TForm)
    pnl1: TPanel;
    il1: TImageList;
    tvDepart: TTreeView;
    btn1: TSpeedButton;
    lv1: TListView;
    btn2: TButton;
    dtpTime: TDateTimePicker;
    lbl1: TLabel;
    dtpDate: TDateTimePicker;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cbx1: TCheckBox;
    edtBM: TEdit;
    lbl9: TLabel;
    procedure tvDepartDblClick(Sender: TObject);
    procedure tvDepartExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure edtBMClick(Sender: TObject);
  private
    { Private declarations }
    FDepartNodeArr: array of TTreeNode;
    FSelectDepart: string;
    function GetSelectDepart: string;    
    procedure FillDepartTree;
  public
    { Public declarations }
  end;



function ShowMutiAddCard(AOwner: TComponent): Boolean;

implementation

uses
  DMFrm, DateUtils;

{$R *.dfm}

//type
//  TDepartValue = record
//    RKey: Integer;
//    ParentRKey: Integer;
//  end;
//  PDepartValue = ^TDepartValue;

function GetChildNode(ANode: TTreeNode): string;
var
  I: Integer;
begin
  Result := IntToStr(Integer(ANode.Data));
  if ANode.HasChildren then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      Result := Result + ',' + GetChildNode(ANode.Item[I]);
    end;
  end;
end;


function ShowMutiAddCard(AOwner: TComponent): Boolean;
var
  frmMutiAddCard: TfrmMutiAddCard;
begin
  frmMutiAddCard := TfrmMutiAddCard.Create(AOwner);
  try
    Result := frmMutiAddCard.ShowModal = mrOk;
  finally
    frmMutiAddCard.Free;
  end;
end;

procedure TfrmMutiAddCard.btn1Click(Sender: TObject);
var
  LSql: string;
  LItem: TListItem;
begin
  if Trim(FSelectDepart) = '' then
  begin
    ShowMessage('请先 选择部门');
    exit;
  end;
  lv1.Clear;
  LSql := 'SELECT RKey,employeecode, chinesename, cardno FROM employeemsg WHERE ' +
          ' status = 1  AND departmentid in ' + FSelectDepart;     //and len(cardno)=10
  if DM1.SQLOpen(LSql) then
  begin
    dm1.qrytmp.First;
    while not dm1.qrytmp.Eof do
    begin
      LItem := lv1.Items.Add;
      LItem.SubItems.Add(dm1.qrytmp.FieldByName('employeecode').AsString);
      LItem.SubItems.Add(dm1.qrytmp.FieldByName('chinesename').AsString);
      LItem.SubItems.Add(dm1.qrytmp.FieldByName('cardno').AsString);
      LItem.Data := Pointer(dm1.qrytmp.FieldByName('RKey').AsInteger);
      dm1.qrytmp.Next;
    end;
  end;
  lbl4.Caption := IntToStr(dm1.qrytmp.RecordCount);
end;

procedure TfrmMutiAddCard.btn2Click(Sender: TObject);
var
  str: string;
  str2: string;
  I: Integer;
  nCOunt: Integer;
  LSql: string;

  LItem: TListItem;
  nSucc: Integer;
begin
  nCOunt := 0;
  nSucc := 0;
  for I := 0 to lv1.Items.Count - 1 do
    if lv1.Items[I].Checked then
    begin
      Inc(nCOunt);
    end;

  str := '是否为选中的 ' + IntToStr(nCount) + '个人  添加打卡记录？';
  str := str + #13 + '   时间为：' + FormatDateTime('YYYY-MM-DD hh:mm:ss',dateof(dtpdate.Date) + timeof(dtptime.Time));
  if MessageBox(Handle,PChar(str),'注意',MB_YESNO) = ID_YES then
  begin
    str := '';

    for I := 0 to lv1.Items.Count - 1 do
    begin
      LItem := lv1.Items[I];
      if LItem.Checked then
      begin

        LSql := 'INSERT INTO OriginalCheckData VALUES(';
        if LItem.SubItems[2] <>'' then
          LSql := LSql + QuotedStr(LItem.SubItems[2])
        else
          LSql := LSql + QuotedStr('000');

        LSql := LSql + ','+QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss',dateof(dtpdate.Date) + timeof(dtptime.Time))) +
                ','+QuotedStr(FormatDateTime('YYYY-MM-DD',dateof(dtpdate.Date) + timeof(dtptime.Time))) +
                ','+QuotedStr(FormatDateTime('hh:mm:ss',dateof(dtpdate.Date) + timeof(dtptime.Time))) +
                ',36,'+ IntToStr(Integer(LItem.Data)) + ',0,0,0,';
        str2 := LItem.SubItems[2] + FormatDateTime('YYYYMMDD',dateof(dtpdate.Date) + timeof(dtptime.Time))
          + FormatDateTime('hhmmss',dateof(dtpdate.Date) + timeof(dtptime.Time)) + '00';
        LSql := LSql + QuotedStr(str2)+')';
        try
          if not DM1.SQLExec(LSql) then
            str := str + LItem.SubItems[0] + '  ' + LItem.SubItems[1] + '  ' + LItem.SubItems[2] + ' 添加失败 '
          else
            inc(nSucc);
        except

        end;
      end;
    end;
    str := str + '成功添加: ' + IntToStr(nSucc) + ' 条';
    ShowMessage(str);
  end;

end;

procedure TfrmMutiAddCard.cbx1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lv1.Items.Count - 1 do
  begin
    lv1.Items[I].Checked := cbx1.Checked;
  end;
end;

procedure TfrmMutiAddCard.FillDepartTree;
var
  LSql: string;
  LParnentNode: TTreeNode;
  I: Integer;
begin
  SetLength(FDepartNodeArr,0);
  tvDepart.Items.Clear;
  LParnentNode := nil;
  LSql := ' ;WITH tmp(departmentname,Lv,rkey,superior) AS ' +
          ' (SELECT departmentname,1,rkey,superior FROM datadepartment WHERE (superior = 0 or superior is null) ' +
          ' UNION ALL ' +
          ' SELECT D2.departmentname,tmp.Lv+1,D2.RKey,D2.superior FROM datadepartment D2 ' +
          ' INNER JOIN tmp ON D2.superior = tmp.RKey ) ' +
          ' SELECT * FROM tmp ORDER BY lv ' ;
  if DM1.SqlOpen(LSql) then
  begin
    DM1.qrytmp.First;
    while not DM1.qrytmp.Eof do
    begin
      if DM1.qrytmp.FieldByName('superior').AsInteger = 0 then
        LParnentNode := nil
      else
      begin
        for I := 0 to Length(FDepartNodeArr) - 1 do
        begin
          if Integer(FDepartNodeArr[I].Data) = DM1.qrytmp.FieldByName('superior').AsInteger then
            LParnentNode := FDepartNodeArr[I];
        end;
      end;
      SetLength(FDepartNodeArr,Length(FDepartNodeArr)+1);
      FDepartNodeArr[High(FDepartNodeArr)] :=
        tvDepart.Items.AddChildObject(LParnentNode,DM1.qrytmp.fieldbyname('departmentname').AsString,Pointer(DM1.qrytmp.FieldByName('rkey').asinteger));
      DM1.qrytmp.Next;
    end;
  end;
end;

procedure TfrmMutiAddCard.FormShow(Sender: TObject);
begin
  dtpDate.Date := DateOf(Now());
  dtpTime.Time := TimeOf(Now());
  FillDepartTree;
end;

procedure TfrmMutiAddCard.tvDepartDblClick(Sender: TObject);
var
  LP: TPoint;
  LItem: TTreeNode;
begin
  LP := tvDepart.ScreenToClient(Mouse.CursorPos);
  LItem := tvDepart.GetNodeAt(LP.X,LP.Y);
  if Assigned(LItem) then
  begin
    edtBM.Text := LItem.Text;
    edtBM.Tag := Integer(LItem);
    tvDepart.Visible := False;
    FSelectDepart := GetSelectDepart;
  end;
end;

procedure TfrmMutiAddCard.tvDepartExit(Sender: TObject);
begin
  tvDepart.Visible := False;
end;

procedure TfrmMutiAddCard.edtBMClick(Sender: TObject);
begin
  tvDepart.Left := edtBM.Left;
  tvDepart.Top := edtBM.Top + edtBM.Height;
  tvDepart.Visible := True;
  tvDepart.SetFocus;
end;

function TfrmMutiAddCard.GetSelectDepart: string;
begin
  Result := '(-1,' + GetChildNode(tvDepart.Selected) + ')';
end;

end.
