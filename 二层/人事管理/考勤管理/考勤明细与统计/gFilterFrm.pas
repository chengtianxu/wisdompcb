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
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBGridEh, Buttons;

type
  TfrmFilter = class(TForm)
    pnl2: TPanel;
    btnAdd: TButton;
    pnl1: TPanel;
    btnDelete: TSpeedButton;
    btnReset: TSpeedButton;
    btnCancel: TSpeedButton;
    pnl3: TPanel;
    lbl1: TLabel;
    lvWhereList: TListView;
    pnl4: TPanel;
    lvField: TListView;
    lbl2: TLabel;
    grp1: TGroupBox;
    pgc1: TPageControl;
    tsStr: TTabSheet;
    lbl4: TLabel;
    edtFilter: TLabeledEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    pnl5: TPanel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl9: TLabel;
    edtBM: TEdit;
    btnDepartTree: TSpeedButton;
    pnl6: TPanel;
    btnOK: TSpeedButton;
    cbbLocked: TComboBox;
    lbl10: TLabel;
    tvDepart: TTreeView;
    procedure btnOKClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDepartTreeClick(Sender: TObject);
    procedure tvDepartExit(Sender: TObject);
    procedure tvDepartDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvFieldChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    FDepartNodeArr: array of TTreeNode;
    FSelectDepart: string;
    procedure FillDepartTree;
    function GetSelectDepart: string;
    function GetFilterText: string;
    function GetUserPermitDepart: string;
  public
    { Public declarations }
    function GetWhereString: string;
  end;

var
  gFilterFrom: TfrmFilter;
  
implementation

uses
  DateUtils, DMFrm, WZ_gUnit,common;

{$R *.dfm}

procedure TfrmFilter.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFilter.btnDeleteClick(Sender: TObject);
begin
  lvWhereList.DeleteSelected;
end;

procedure TfrmFilter.btnResetClick(Sender: TObject);
begin
  lvWhereList.Clear;
  edtFilter.Text := '';
end;

procedure TfrmFilter.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFilter.FormCreate(Sender: TObject);
var
  LSvrDatetime: TDateTime;
begin
  LSvrDatetime := DM1.GetServerTime;
  dtp1.Date := DateOf(LSvrDatetime);
  dtp2.Date := DateOf(LSvrDatetime);
  FillDepartTree;
end;

procedure TfrmFilter.btnDepartTreeClick(Sender: TObject);
begin
  tvDepart.Left := edtBM.Left;
  tvDepart.Top := edtBM.Top + edtBM.Height;
  tvDepart.Visible := True;
  tvDepart.SetFocus;
end;

procedure TfrmFilter.tvDepartExit(Sender: TObject);
begin
  tvDepart.Visible := False;
end;

procedure TfrmFilter.tvDepartDblClick(Sender: TObject);
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

function TfrmFilter.GetWhereString: string;
begin
  //时间
  Result := '  where   D1.CheckDate BETWEEN ' + QuotedStr(WZ_gUnit.gDateTimeToStr(dtp1.DateTime)) +   //len(d2.sicardno)>0 and
            ' AND ' + QuotedStr(WZ_gUnit.gDateTimeToStr(dtp2.DateTime));
  //查询部门
  if FSelectDepart <> '' then
    Result := Result + ' AND D5.Rkey IN ' + FSelectDepart;
  //用户部门查看权限
  Result := Result + ' AND D2.departmentid IN ' + GetUserPermitDepart;

  //锁定状态
  case cbbLocked.ItemIndex of
    0:;
    1: Result := Result + ' AND (d1.locked=1) ';
    2: Result := Result + ' AND (d1.locked=0) ';
  end;
  //条件定义
  Result := Result + GetFilterText;
  //排序
  //Result := Result + ' ORDER BY d1.Rkey ASC ';
end;

procedure TfrmFilter.FillDepartTree;
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

function TfrmFilter.GetSelectDepart: string;
begin
  Result := '(-1,' + GetChildNode(tvDepart.Selected) + ')';
end;

procedure TfrmFilter.btnAddClick(Sender: TObject);
  procedure AddToFilterList(AField,AValue: string);
  var
    I: Integer;
    bAdd: Boolean;
  begin
    bAdd := True;
    for I := 0 to lvWhereList.Items.Count - 1 do
    begin
      if lvWhereList.Items[I].Caption = AField then
      begin
        lvWhereList.Items[I].SubItems[0] := AValue;
        BAdd := False;
      end;
    end;
    if bAdd then
    begin
      with lvWhereList.Items.Add do
      begin
        Caption := AField;
        SubItems.Add(AValue);
      end;
    end;
  end;
var
  LFiled,LValue: string;
begin
  if edtFilter.Text = '' then Exit;
  
  case lvField.ItemIndex of
    0:
    begin
      LFiled := lvField.Items[lvField.ItemIndex].Caption;
      LValue := 'D2.employeecode Like ''%' + edtFilter.Text + '%''';
    end;
    1:
    begin
      LFiled := lvField.Items[lvField.ItemIndex].Caption;
      LValue := 'D2.ChineseName Like ''%' + edtFilter.Text + '%''';
    end;
    2:
    begin
      LFiled := lvField.Items[lvField.ItemIndex].Caption;
      LValue := 'd1.ClassID IN (select rkey from class where class.rkey = D1.ClassID and class.classname like ''%' + edtFilter.Text + '%'')';
    end;
     3:
    begin
      LFiled := lvField.Items[lvField.ItemIndex].Caption;
      LValue := 'd7.item  like ''%' + Trim(edtFilter.Text) + '%'' ';
    end;

  end;
  AddToFilterList(LFiled,LValue);
end;

procedure TfrmFilter.FormShow(Sender: TObject);
begin
  btnResetClick(btnReset);
  lvField.ItemIndex := 0;
  lvField.Items[0].Focused := True;
end;

procedure TfrmFilter.lvFieldChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if lvField.ItemIndex <> -1 then
    edtFilter.EditLabel.Caption := lvField.Items[lvField.itemindex].Caption;
end;

function TfrmFilter.GetFilterText: string;
var
  I: Integer;
begin
  for I := 0 to lvWhereList.Items.Count - 1 do
  begin
    Result := Result + ' AND ' + lvWhereList.Items[I].SubItems[0];
  end;
  //if Result <> '' then Result := ' AND ' + Result;
end;

function TfrmFilter.GetUserPermitDepart: string;
var
  LSql: string;
begin
  lSql := ' select hr_permission.departmentid FROM hr_permission ' +
          ' INNER JOIN Data0419 ON Data0419.RKey = hr_permission.program_ptr ' +
          ' WHERE hr_permission.operator_ptr = ' + rkey73 + ' AND Data0419.PROGRAME = ' + QuotedStr('KQTJ.EXE');
  DM1.SqlOpen(LSql);
  Result := '(-1';
  DM1.qrytmp.First;
  while not DM1.qrytmp.Eof do
  begin
    Result := Result + ',' + DM1.qrytmp.FieldByName('departmentid').AsString;
    DM1.qrytmp.Next;
  end;
  Result := Result + ')';
end;

end.
