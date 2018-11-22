unit YYD7340Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseReportFrm, BaseFrm, Menus, DB, ADODB, Grids, DBGridEh,
  StdCtrls, ExtCtrls, Buttons, Spin;

type
  TfrmYYD7340 = class(TfrmBaseReportFrm)
    chk1: TCheckBox;
    procedure btnResetClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNowReelID: Int64;
    function GetBCBHInfo(AManu_Part_Number: string): Boolean;override;
  end;


implementation

uses
  DM, WZ_gUnit;

{$R *.dfm}

procedure TfrmYYD7340.btnResetClick(Sender: TObject);
begin
  inherited;
  edtCPMS.Text := IntToStr(GetNowReelID + 1) ;
  edtCPMS.ReadOnly := True;
end;

function TfrmYYD7340.GetNowReelID: Int64;
var
  LSql: string;
begin
  inherited;
  if FCustCode <> FSaleCustCode then
  begin
    LSql := ' SELECT isnull(d699.[description],0) as description FROM DATA0698 d698 ' +
            ' inner JOIN DATA0699 d699 ON d698.rkey = d699.pack_ptr ' +
            ' INNER JOIN data0025 d25 on d25.manu_part_number = d699.manu_part_number ' +
            ' INNER JOIN Data0010 d10 ON d10.abbr_name = d25.ORIG_CUSTOMER ' +
            ' where d10.cust_code = ' + QuotedStr(FCustCode) +
            ' ORDER BY d699.description DESC';
  end else
  begin
    LSql := ' SELECT isnull(d699.[description],0) as description FROM DATA0698 d698 ' +
            ' inner JOIN DATA0699 d699 ON d698.rkey = d699.pack_ptr ' +
            ' INNER JOIN data0025 d25 on d25.manu_part_number = d699.manu_part_number ' +
            ' INNER JOIN Data0010 d10 ON d10.rkey = d25.customer_ptr ' +
            ' where d10.cust_code = ' + QuotedStr(FCustCode) +
            ' ORDER BY d699.description DESC';
  end;

  DM1.SqlOpen(LSql);
  if not dm1.qrytmp.IsEmpty then
    Result := DM1.qrytmp.fieldbyname('description').AsInteger
  else
    Result := 832000156;
end;

procedure TfrmYYD7340.btnOKClick(Sender: TObject);
var
  LSql: string;
  LPcsCount: Integer;
  LNowID: Integer;
begin
  LPcsCount := 0;
  if (not ads699.Active) or ads699.IsEmpty then
  begin
    ShowMessage('没有要保存的数据');
    Exit;
  end;
  DM1.SqlOpen('select SEED_VALUE,seed_flag,table_name,getdate() as nowtime  from data0004  where rkey = 74');
  if DM1.qrytmp.IsEmpty then
  begin
    edtBQDM.Text := '00001';
  end else
  begin
    edtBQDM.Text := DM1.qrytmp.FieldByName('SEED_VALUE').AsString;
  end;

  DM1.con1.BeginTrans;
  try
  try
    //标签代码+1
    if not DM1.SqlExec('UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncBQDM(edtBQDM.Text)) + ' WHERE RKey = 74') then
    begin
      ShowMessage('标签代码更新失败');
      Exit;
    end;

    //总计的数量
    ads699.First;
    while not ads699.Eof do
    begin
      LPcsCount := LPcsCount + ads699.FieldByName('qty').AsInteger;
      ads699.Next;
    end;

    //超过订单的数量则禁止保存
//    if LPcsCount + StrToIntDef(lblYDY.Caption,0) > StrToIntDef(lblDDS.Caption,0) then
//    begin
//      ShowMessage('打印数量已经超过订单数，禁止保存，请用高级权限清空打印数!');
//      Exit;
//    end;

{
    //0= 失败,1=通过，2=有回复交期更早的，3=同交期有订单号在前的，4=打印超过订单数量
    case Tsearchso_Form.CheckPOOrder(edtBCBH.Text,edtXSDD.Text) of
      0:
      begin
        //ModalResult := mrOk;
      end;
      1:
      begin
        //ModalResult := mrOk;
      end;
      2:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('有回复交期更早的订单，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end; //else
          //ModalResult := mrOk;
      end;
      3:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('有靠前的订单号没打印，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end;// else
          //ModalResult := mrOk;
      end;
      4:
      begin
        if gUser.User_Permit <> '4' then
        begin
          ShowMessage('该订单已经打印标签数量已经超出，普通权限禁止打印，如需打印请用高级权限');
          Exit;
        end;// else
          //ModalResult := mrOk;
      end;
    end;
}




    //新增标签
    LSql := ' INSERT INTO Data0698(pack_number,so_ptr,description,code,qty,lotno,v_date,empl_ptr,pack_item,type,surface,netWeight,grossWeight,caseSpec) ' +
    ' VALUES(' + QuotedStr(edtBQDM.Text) + ',' + IntToStr(edtXSDD.Tag) + ',' + QuotedStr(edtCPMS.Text) + ',' +  QuotedStr(edtKGDM.Text) + ',' + IntToStr(LPcsCount) + ',' +
    QuotedStr(edtSCZQ.Text) + ',getdate(),' + gUser.User_Ptr + ',' + edtBQSL.Text + ',' +  QuotedStr(rgLX.Items[rgLX.ItemIndex]) + ',' +
    QuotedStr(edtBMCL.Text) + ',' + QuotedStr(edtJZ.Text) + ',' + QuotedStr(edtMZ.Text) + ',' + QuotedStr(edtZXGG.Text) +
    ')';
    if not DM1.SqlExec(LSql) then
    begin
      ShowMessage('保存失败');
      Exit;
    end;
    LNowID := GetNowReelID;
    DM1.SqlOpen('SELECT MAX(RKey) AS RKey698 FROM Data0698');
    ads699.First;
    while not ads699.Eof do
    begin
      ads699.Edit;
      ads699.FieldByName('pack_ptr').Value := DM1.qrytmp.FieldByName('RKey698').AsInteger;
      ads699.FieldByName('description').AsInteger := LNowID+ 1;
      if chk1.Checked then
        ads699.FieldByName('notes').AsString :=  ads699.FieldByName('notes').AsString + '*';
      ads699.Post;
      LNowID := LNowID + 1;
      ads699.Next;
    end;
    ads699.UpdateBatch(arAll);

    //销售订单中以打印数增加
    if rgLX.ItemIndex = 1 then
    begin
      if not DM1.SqlExec('UPDATE Data0060 SET REPUT_QTY = ' + IntToStr(StrToIntDef(lblYDY.Caption,0)+ LPcsCount) + ' WHERE RKey = ' + IntToStr(edtXSDD.Tag)) then
      begin
        ShowMessage('更新销售订单已经打印数字失败');
        Exit;
      end;
    end;

    //修改25表的纸箱规格
    DM1.SqlExec('update data0025 set packsize = ' + QuotedStr(edtZXGG.Text) + ' where manu_part_number = ' + QuotedStr(edtBCBH.Text));

    DM1.con1.CommitTrans;
    ModalResult := mrOk;
  except
    ShowMessage('保存失败');
    Exit;
  end;
  finally
    if DM1.con1.InTransaction then DM1.con1.RollbackTrans;
  end;
end;

function TfrmYYD7340.GetBCBHInfo(AManu_Part_Number: string): Boolean;
var
  lsql: string;
begin
  Lsql := 'SELECT REPORT_UNIT_VALUE1,ANALYSIS_CODE_2,MANU_PART_DESC, set_qty,PRODUCT_NAME,set_lngth,set_width,packsize FROM Data0025 ' +
          ' LEFT JOIN Data0008 ON Data0025.PROD_CODE_PTR = Data0008.Rkey ' +
          //' inner join data0006 d06 on d06.bom_ptr = data0025.rkey ' +
          //' inner join data0056 d56 on d56.wo_ptr = d06.rkey ' +
          ' WHERE Manu_PART_NUMBER = ' + QuotedStr(AManu_Part_Number);
  Result := False;
  DM1.SqlOpen(Lsql);
  if DM1.qrytmp.IsEmpty then
  begin
    FPcsWeight := 0;
    ShowMessage('本厂编号错误, 或者无此型号的在线作业单');
    Exit;
  end else
  begin
    FPcsWeight := DM1.qrytmp.fieldbyname('REPORT_UNIT_VALUE1').AsFloat;
    edtKHWL.Text := DM1.qrytmp.FieldByName('ANALYSIS_CODE_2').AsString;
    edtKHXH.Text := DM1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
    lblPcsPerSet.Caption := DM1.qrytmp.FieldByName('set_qty').AsString;
    //edtBMCL.Text := DM1.qrytmp.fieldbyname('PRODUCT_NAME').AsString;
    FSetW := DM1.qrytmp.fieldbyname('set_lngth').AsString;
    FSetH := DM1.qrytmp.fieldbyname('set_width').AsString;
    if edtZXGG.Text = '' then
      edtZXGG.Text := DM1.qrytmp.fieldbyname('packsize').AsString;
    Result := True;
  end;
end;

end.
