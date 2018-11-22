unit POPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, DB, ADODB, DM,
  Provider, DBClient;

type
  TfrmPOPost = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edtPO: TEdit;
    eh1: TDBGridEh;
    lbl4: TLabel;
    lbl5: TLabel;
    edtPostPcs: TEdit;
    pnl3: TPanel;
    btn2: TButton;
    lbl1: TLabel;
    edtweight: TEdit;
    lbl2: TLabel;
    lblAllpcs: TLabel;
    lbl6: TLabel;
    lblNeedPcs: TLabel;
    ds1: TDataSource;
    pnl4: TPanel;
    lbl10: TLabel;
    edtBZ: TEdit;
    lbl3: TLabel;
    lbl97PoNumber: TLabel;
    cds1: TClientDataSet;
    dsp1: TDataSetProvider;
    cds1work_order_number: TStringField;
    cds1manu_part_number: TStringField;
    cds1Canusepcs: TFloatField;
    cds1CanUsePNL: TIntegerField;
    cds1dept_name: TStringField;
    cds1rkey06: TAutoIncField;
    cds1Checked: TBooleanField;
    cds1PostPcs: TIntegerField;
    cds1PostPNL: TIntegerField;
    cds1PARTS_PER_PANEL: TFloatField;
    qry1: TADOQuery;
    qry1Checked: TBooleanField;
    qry1PostPcs: TIntegerField;
    qry1PostPNL: TIntegerField;
    qry1work_order_number: TStringField;
    qry1manu_part_number: TStringField;
    qry1Canusepcs: TFloatField;
    qry1CanUsePNL: TIntegerField;
    qry1dept_name: TStringField;
    qry1PARTS_PER_PANEL: TFloatField;
    qry1rkey06: TAutoIncField;
    procedure edtweightExit(Sender: TObject);
    procedure edtPostPcsKeyPress(Sender: TObject; var Key: Char);
    procedure edtPostPcsExit(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCanUseWO: Boolean;
    function GetPOInfo: Boolean;
    function FillPostNum: Boolean;
    function CheckPostNum: Boolean;
    function ChekcWeight: Boolean;
  end;

implementation

uses
  StrUtils, Math;

{$R *.dfm}

{ TfrmPOPost }

function TfrmPOPost.GetCanUseWO: Boolean;
var
  LSql: string;
begin
  Result := False;
  if edtPO.Tag <= 0 then Exit;
  try
    qry1.Close;
    qry1.Parameters[0].Value := dm1.cdsPO.fieldbyname('manu_part_number').AsString + '%';
    qry1.Open;
    cds1.Data := dsp1.Data;

    //('退货返工作业单还未确认包装入库,请先让品质部确认!');
    cds1.First;
    while not cds1.Eof do
    begin
      LSql := ' select 1 from data0006 ' +
              ' inner join data0492 on data0006.CUT_NO=data0492.CUT_NO ' +
              ' inner join data0414 on data0492.mrb_ptr=data0414.rkey ' +
              ' inner join data0415 on data0414.d415_ptr=data0415.rkey ' +
              ' inner join data0098 on data0415.rma_ptr=data0098.rkey ' +
              ' where data0006.rkey= '+dm1.adsWOrkey06.AsString;
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          LSql := 'select confirm_pack from data0492 d492 inner join data0006 d06 on ' +
                  ' d06.CUT_NO = d492.CUT_NO where d06.rkey = ' + cds1.fieldbyname('rkey06').AsString;
          if dm1.SqlOpen(LSql) then
          begin
            if not dm1.qrytmp.IsEmpty then
            begin
              if dm1.qrytmp.FieldByName('confirm_pack').AsInteger = 0 then
              begin
                cds1.Delete;
                Continue;
              end;
            end;
          end;
        end;
      end;
      cds1.Next;
    end;
    cds1.First;
    if cds1.IsEmpty then
    begin
      ShowMessage('没有找到对应匹配的作业单');
      Exit;
    end;
    Result := True;
  finally
    qry1.Close;
  end;
end;

function TfrmPOPost.GetPOInfo: Boolean;
var
  LSql: string;
begin
  Result := False;
  LSql := 'select d60.COMMISION_ON_TOOLING,(d60.PARTS_ORDERED + d60.PARTS_RETURNED) as AllPcs,(d60.PARTS_ORDERED + d60.PARTS_RETURNED)- ISNULL(d60.REPUT_APPR_BY, 0) AS needpcs,d97.po_number, d25.REPORT_UNIT_VALUE1 from data0060 d60 ' +
          ' inner join data0097 d97 on d97.rkey = d60.PURCHASE_ORDER_PTR ' +
          ' inner join data0025 d25 on d25.rkey = d60.CUST_PART_PTR ' +
          ' where d60.rkey = ' + IntToStr(edtPO.Tag);
  if dm1.SqlOpen(LSql) then
  begin
    if not dm1.qrytmp.IsEmpty then
    begin
      lblAllpcs.Caption := dm1.qrytmp.fieldbyname('AllPcs').AsString;
      lblNeedPcs.Caption := dm1.qrytmp.fieldbyname('needpcs').AsString;
      lbl97PoNumber.Caption := dm1.qrytmp.fieldbyname('po_number').AsString;
      if Trim(edtweight.Text) = '' then edtweight.Text := dm1.qrytmp.fieldbyname('REPORT_UNIT_VALUE1').AsString;
      if UpperCase(dm1.qrytmp.fieldbyname('COMMISION_ON_TOOLING').AsString) = 'Y' then
      begin
        if StrToFloatDef(edtweight.Text,0) <= 0 then
        begin
          Result := False;
          ShowMessage('重量不能为0');
          Exit;
        end;
      end; 
      Result := True;
    end else
    begin
      lblAllpcs.Caption := '';
      lblNeedPcs.Caption := '';
      lbl97PoNumber.Caption := '';
      edtweight.Text := '';
      ShowMessage('无效的销售订单');
      Exit;
    end;
  end;
end;

procedure TfrmPOPost.edtweightExit(Sender: TObject);
begin
  if StrToFloatdef(edtweight.Text,-1) < 0 then
  begin
    ShowMessage('请填写有效的重量');
    edtweight.SetFocus;
  end;
end;

procedure TfrmPOPost.edtPostPcsKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
  begin
    Key := #0;
  end;
  if Key = #8 then
  begin
    if Length(edtPostPcs.Text) = 1 then edtPostPcs.Text := '0';
  end;
end;

function TfrmPOPost.FillPostNum: Boolean;
var
  LPcs: Integer;
begin
  Result := False;
  cds1.DisableControls;
  try
    cds1.First;
    while not cds1.Eof do
    begin
      cds1.Edit;
      cds1.FieldByName('postpcs').AsInteger := 0;
      cds1.FieldByName('postpnl').AsInteger := 0;
      cds1.FieldByName('checked').AsBoolean := False;
      cds1.Post;
      cds1.Next;
    end;
    LPcs := StrToIntDef(edtPostPcs.Text,0);
    if LPcs <= 0 then Exit;
    if cds1.IsEmpty then Exit;
    cds1.First;
    while not cds1.Eof do
    begin
      if LPcs <= 0 then Break;
      if LPcs >= cds1.FieldByName('canusepcs').AsInteger then
      begin
        cds1.Edit;
        cds1.FieldByName('postpcs').AsInteger := cds1.fieldbyname('canusepcs').AsInteger;
        cds1.FieldByName('postpnl').AsInteger := cds1.fieldbyname('canusepnl').AsInteger;
        cds1.FieldByName('checked').AsBoolean := True;
        LPcs := LPcs - cds1.fieldbyname('canusepcs').AsInteger;
        cds1.Post;
      end else
      begin
        cds1.Edit;
        cds1.FieldByName('postpcs').AsInteger := LPcs;
        cds1.FieldByName('postpnl').AsInteger :=
          Min(cds1.fieldbyname('canusepnl').AsInteger,Round(LPcs / cds1.FieldByName('PARTS_PER_PANEL').AsInteger));
        cds1.FieldByName('checked').AsBoolean := True;
        LPcs := 0;
        cds1.Post;
      end;
      cds1.Next;
    end;
    if LPcs > 0 then
    begin
      cds1.First;
      while not cds1.Eof do
      begin
        cds1.Edit;
        cds1.FieldByName('postpcs').AsInteger := 0;
        cds1.FieldByName('postpnl').AsInteger := 0;
        cds1.FieldByName('checked').AsBoolean := False;
        cds1.Post;
        cds1.Next;
      end;
      ShowMessage('提交的数量大于可用作业单的数量');
      edtPostPcs.SetFocus;
      Exit;
    end else
      Result := True;
  finally
    cds1.EnableControls;
  end;
end;

procedure TfrmPOPost.edtPostPcsExit(Sender: TObject);
begin
  if CheckPostNum then
    FillPostNum;
end;

function TfrmPOPost.CheckPostNum: Boolean;
var
  LPcs: Integer;
begin
  Result := False;
  LPcs := StrToIntDef(edtPostPcs.Text,0);
  if LPcs <= 0 then
  begin
    ShowMessage('请填写正确的数量');
    edtPostPcs.SetFocus;
    Exit;
  end;
  if LPcs > StrToIntDef(lblNeedPcs.Caption,0) then
  begin
    ShowMessage('填写的数量大于可提交数量');
    edtPostPcs.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmPOPost.btn2Click(Sender: TObject);
begin
  if not GetPOInfo then Exit;
  if not GetCanUseWO then Exit;
  if not CheckPostNum then Exit;
  if not FillPostNum then Exit;
  ModalResult := mrOk;
end;

function TfrmPOPost.ChekcWeight: Boolean;
begin
  if StrToFloatdef(edtweight.Text,-1) < 0 then
  begin
    Result := False;
    edtweight.SetFocus;
    ShowMessage('请填写正确的重量');
  end else
    Result := True;
end;

procedure TfrmPOPost.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

end.
