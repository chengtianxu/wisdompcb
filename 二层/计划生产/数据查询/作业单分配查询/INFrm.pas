unit INFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls, ImgList;



type
  PTreeValue=^TTreeValue;

  TTreeValue = record
    wo_ptr:integer;
    SOURCE_PTR:integer;
  end;

type
  TfrmIN = class(TForm)
    pnl1: TPanel;
    btnClose: TBitBtn;
    pnl2: TPanel;
    pnl3: TPanel;
    tv1: TTreeView;
    ehData: TDBGridEh;
    imagelist1: TImageList;
    procedure ehDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure get_treedate(rkey06out: integer;treeview:Ttreeview);
  end;

var
  frmIN: TfrmIN;

implementation

uses damo;

{$R *.dfm}

{ TfrmIN }

procedure TfrmIN.get_treedate(rkey06out: integer; treeview: Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0489:PTreeValue;
 LNodeArr:array of TTreeNode;
 i,j:Integer;
begin
  with dm.aqtmp do
  begin
    close;
    sql.text:=';WITH CTE(wo_ptr,SOURCE_PTR,lv) as  ' + #13+
              '  (     ' + #13+
              '    SELECT wo_ptr,SOURCE_PTR,0 from Data0489 WHERE wo_ptr = ' + IntToStr(rkey06out) +
              '    UNION ALL  ' + #13+
              '    SELECT Data0489.wo_ptr,Data0489.SOURCE_PTR,CTE.lv +1 from Data0489 inner join CTE on CTE.SOURCE_PTR = data0489.WO_PTR   ' + #13+
              '  )      ' + #13+
              '  SELECT CTE.Wo_ptr,CTE.SOURCE_PTR,Data0006.WORK_ORDER_NUMBER,CTE.lv FROM CTE INNER JOIN Data0006 on CTE.SOURCE_PTR = Data0006.RKEY   ';
    open;
    if not IsEmpty then
    begin
      new(rkey0489);
      rkey0489.wo_ptr := dm.ads489.FieldByName('wo_ptr').AsInteger;
      rkey0489.SOURCE_PTR:= dm.ads489.FieldByName('SOURCE_PTR').AsInteger;
      node := tv1.Items.AddObject
          (nil, dm.ads489.FieldByName('out_wo').AsString,rkey0489); //增加顶层节点
      SetLength(LNodeArr,1);
      LNodeArr[0]:= node;
      j:=1;
      while not Eof do
      begin
        new(rkey0489);
        rkey0489.wo_ptr := fieldvalues['wo_ptr'];
        rkey0489.SOURCE_PTR:= fieldvalues['SOURCE_PTR'];
        if fieldbyname('lv').AsInteger = 0 then
          node := treeview.Items.AddChildObject
          (LNodeArr[0],fieldbyname('WORK_ORDER_NUMBER').AsString,rkey0489) //增加顶层节点
        else
        begin
          for i:=1 to Length(LNodeArr)-1 do
          begin
            if PTreeValue(LNodeArr[i].data)^.SOURCE_PTR = fieldbyname('wo_ptr').AsInteger  then
            begin
              node := tv1.Items.AddChildObject
              (LNodeArr[i],fieldbyname('WORK_ORDER_NUMBER').AsString,rkey0489);
              Break;
            end;
          end;
        end;
        SetLength(LNodeArr,Length(LNodeArr) + 1);
        LNodeArr[j]:= node;
        j:=j + 1;
        node.ImageIndex:= 0;  //为节点定义图画
        Next;
      end;
    end;
  end;
  tv1.FullExpand; //全部展开
end;

procedure TfrmIN.ehDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
          showmessage(dm.adsIN.commandtext);
end;

procedure TfrmIN.tv1Change(Sender: TObject; Node: TTreeNode);
begin
//  Node.SelectedIndex:= 1;
//  if Node.Level = 0 then
//  begin
//    with dm.adsIN do
//    begin
//      close;
//      CommandText:=';WITH CTE as    ' + #13+
//                   ' (   ' + #13+
//                   '   SELECT  rkey,wo_ptr,SOURCE_PTR from Data0489 WHERE WO_PTR = ' + inttostr(PTreeValue(Node.data)^.wo_ptr) + #13+
//                   '   UNION ALL    ' + #13+
//                   '   SELECT data0489.rkey,Data0489.wo_ptr,Data0489.SOURCE_PTR from Data0489 inner join CTE on CTE.SOURCE_PTR = data0489.WO_PTR   ' + #13+
//                   ' )     ' + #13+
//                   ' SELECT D06.work_order_number AS out_wo,D25.manu_part_number AS out_no,D06.quan_sch,     ' + #13+
//                   '   CASE D06.wipmat_status WHEN 0 THEN ''待分配'' ELSE ''已分配'' END AS mat_status,   ' + #13+
//                   '   D489.qty,D05.employee_name,D489.tdate,D06_1.work_order_number AS inner_wo,   ' + #13+
//                   '   D25_1.manu_part_number AS inner_no,D25_1.qty_bom    ' + #13+
//                   ' FROM CTE INNER JOIN Data0489 d489 on CTE.rkey = d489.rkey   ' + #13+
//                   '   INNER JOIN Data0006 d06 ON d489.wo_ptr=d06.rkey     ' + #13+
//                   '   INNER JOIN data0025 d25 ON d06.bom_ptr=d25.rkey     ' + #13+
//                   '   INNER JOIN data0006 d06_1 ON d489.source_ptr=d06_1.rkey    ' + #13+
//                   '   INNER JOIN data0025 d25_1 ON d489.bom_ptr=d25_1.rkey   ' + #13+
//                   '   LEFT JOIN data0005 d05 ON d489.user_ptr=d05.rkey     ';
//      open;
//    end;
//  end
//  else
//  begin
//    with dm.adsIN do
//    begin
//      close;
//      CommandText:=';WITH CTE as    ' + #13+
//                   ' (   ' + #13+
//                   '   SELECT  rkey,wo_ptr,SOURCE_PTR from Data0489 WHERE WO_PTR = ' + inttostr(PTreeValue(Node.data)^.SOURCE_PTR) + #13+
//                   '   UNION ALL    ' + #13+
//                   '   SELECT data0489.rkey,Data0489.wo_ptr,Data0489.SOURCE_PTR from Data0489 inner join CTE on CTE.SOURCE_PTR = data0489.WO_PTR   ' + #13+
//                   ' )     ' + #13+
//                   ' SELECT D06.work_order_number AS out_wo,D25.manu_part_number AS out_no,D06.quan_sch,     ' + #13+
//                   '   CASE D06.wipmat_status WHEN 0 THEN ''待分配'' ELSE ''已分配'' END AS mat_status,   ' + #13+
//                   '   D489.qty,D05.employee_name,D489.tdate,D06_1.work_order_number AS inner_wo,   ' + #13+
//                   '   D25_1.manu_part_number AS inner_no,D25_1.qty_bom    ' + #13+
//                   ' FROM CTE INNER JOIN Data0489 d489 on CTE.rkey = d489.rkey   ' + #13+
//                   '   INNER JOIN Data0006 d06 ON d489.wo_ptr=d06.rkey     ' + #13+
//                   '   INNER JOIN data0025 d25 ON d06.bom_ptr=d25.rkey     ' + #13+
//                   '   INNER JOIN data0006 d06_1 ON d489.source_ptr=d06_1.rkey    ' + #13+
//                   '   INNER JOIN data0025 d25_1 ON d489.bom_ptr=d25_1.rkey   ' + #13+
//                   '   LEFT JOIN data0005 d05 ON d489.user_ptr=d05.rkey     ';
//      open;
//    end;
//  end;
end;

end.
