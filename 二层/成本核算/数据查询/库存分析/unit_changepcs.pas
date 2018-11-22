unit unit_changepcs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, damo, DB;

type
  TfrmChangePcsPrice = class(TForm)
    btn1: TButton;
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FD444rkey: string;
    FType: string;  //wip or fg
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmChangePcsPrice.btn1Click(Sender: TObject);
var
  LRecNo: Integer;
  lCount,lCount2: Double;
  LRkey451: string;
  LNew372Value: Single;
  lsql: string;
begin
  if StrToFloatDef(edt1.Text,-1) < 0 then
  begin
    ShowMessage('请输入正确的材料成本pcs');
    Exit;
  end;
  if StrToFloatDef(edt2.Text,-1) < 0 then
  begin
    ShowMessage('请输入正确的制造费用pcs');
    Exit;
  end;
  if FType = 'WIP' then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      dm.ADOD448.Edit;
      dm.ADOD448.FieldByName('std_matl_cost_per_pcs').AsFloat := StrToFloat(edt1.Text);
      dm.ADOD448.FieldByName('std_ovhd_cost_per_pcs').AsFloat := StrToFloat(edt2.Text);
      dm.ADOD448.Post;
      lCount := 0;
      lCount2 := 0;
      dm.ADOD448.DisableControls;
      LRecNo := dm.ADOD448.RecNo;
      try
        dm.ADOD448.First;
        while not dm.ADOD448.Eof do
        begin
          lCount := lCount + dm.adod448.fieldbyname('QUANTITY').AsInteger * dm.ADOD448.fieldbyname('std_matl_cost_per_pcs').AsFloat;
          lCount2 := lCount2 + dm.adod448.fieldbyname('QUANTITY').AsInteger * dm.ADOD448.fieldbyname('std_ovhd_cost_per_pcs').AsFloat;
          dm.ADOD448.Next;
        end;
      finally
        dm.ADOD448.RecNo := LRecNo;
        dm.ADOD448.EnableControls;
      end;
      dm.tmp.Close;
      dm.tmp.SQL.Text := 'update data0444 set MATL_CST_IN_WIP_CLOSED = ' + floattostr(lCount)
                          + ', OVHD_CST_IN_WIP_CLOSED = ' + FloatToStr(lCount2)
                          + ' where rkey = ' + fd444rkey;
      dm.tmp.ExecSQL;
      dm.ADOConnection1.CommitTrans;
      ModalResult := mrOk;
    finally
      if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
    end;
  end;
  if FType = 'FG' then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      //修改449
      dm.ADO449.Edit;
      dm.ADO449.FieldByName('std_matl_cost_per_pcs').AsFloat := StrToFloat(edt1.Text);
      dm.ADO449.FieldByName('std_ovhd_cost_per_pcs').AsFloat := StrToFloat(edt2.Text);
      dm.ADO449.Post;
      lCount := 0;
      lCount2 := 0;

       //修改444
      dm.ADO449.DisableControls;
      LRecNo := dm.ADO449.RecNo;
      dm.ADO449.First;
      while not dm.ADO449.Eof do
      begin
        lCount := lCount + dm.ado449.fieldbyname('quan_on_hand').AsInteger * dm.ado449.fieldbyname('std_matl_cost_per_pcs').AsFloat;
        lCount2 := lCount2 + dm.ado449.fieldbyname('quan_on_hand').AsInteger * dm.ado449.fieldbyname('std_ovhd_cost_per_pcs').AsFloat;
        dm.ADO449.Next;
      end;
      dm.ADO449.RecNo := LRecNo;
      dm.ADO449.EnableControls;
      
      dm.tmp.Close;
      dm.tmp.SQL.Text := 'update data0444 set matl_cst_in_fg_closed = ' + floattostr(lCount)
                          + ', ovhd_cst_in_fg_closed = ' + FloatToStr(lCount2)
                          + ' where rkey = ' + fd444rkey;
      dm.tmp.ExecSQL;

      //修改53
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Add('select PLANNED_QTY,cost_pcs,matl_ovhd_pcs,OVHD_COST from data0053 where rkey = ' + dm.ADO449.FieldByName('rkey53').AsString);
      dm.tmp.Open;
      dm.tmp.Edit;
      dm.tmp.FieldByName('matl_ovhd_pcs').AsFloat := StrToFloat(edt1.Text);
      dm.tmp.FieldByName('OVHD_COST').AsFloat := StrToFloat(edt2.Text);
      dm.tmp.Post;
      LNew372Value := dm.tmp.FieldByName('PLANNED_QTY').AsFloat +
                      dm.tmp.FieldByName('cost_pcs').AsFloat +
                      dm.tmp.FieldByName('matl_ovhd_pcs').AsFloat +
                      dm.tmp.FieldByName('OVHD_COST').AsFloat;


      //修改372
      //查出451的rkey,和53的rkey来唯一索引372
      lsql := 'select d451.rkey as rkey451 from data0444 d444 ' +
              ' inner join data0451 d451 on  d451.END_DATE = d444.cut_date ' +
              ' where d444.rkey = ' + fd444rkey;
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Add(lsql);
      dm.tmp.Open;
      LRkey451 := dm.tmp.fieldbyname('rkey451').AsString;

      lsql := 'select closed_cost_per_pcs from data0372 where D0451_PTR = ' + LRkey451 +
              ' and d0053_ptr = ' + dm.ADO449.FieldByName('rkey53').AsString;
      dm.tmp.Close;
      dm.tmp.SQL.Text := lsql;
      dm.tmp.Open;
      dm.tmp.Edit;
      dm.tmp.FieldByName('closed_cost_per_pcs').AsFloat := LNew372Value;
      dm.tmp.Post;

      //修改464
      //通过451的rkey，53的rkey来定位464
      lsql := ' update data0464 ' +
              ' set  matl_cost = data0053.matl_ovhd_pcs*data0464.quan_prod, ' +
              ' ovhd_cost = data0053.ovhd_cost*data0464.quan_prod, ' +
              ' PLANNED_QTY = data0053.PLANNED_QTY*data0464.quan_prod ' +
              ' FROM Data0464 INNER JOIN data0053 ON Data0464.d0053_ptr = data0053.rkey ' +
              ' where Data0464.d0053_ptr = ' + dm.ADO449.FieldByName('rkey53').AsString +
              ' and Data0464.d0451_ptr = '  + LRkey451;
      dm.tmp.Close;
      dm.tmp.SQL.Text := lsql;
      dm.tmp.ExecSQL;

      dm.ADOConnection1.CommitTrans;
      ModalResult := mrok;
    except
      on e: Exception do
      begin
        if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
        ShowMessage(e.Message);
      end;
    end;
  end;
end;

procedure TfrmChangePcsPrice.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then Key := #0;
  if (Key = '.') and (Pos('.',(Sender as TEdit).Text) > 0) then Key := #0;
end;

end.
