unit ProductMix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ImgList;

type
  TFrm_ProductMix = class(TForm)
    TreeView1: TTreeView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    rkey25: TLabel;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure get_treedate(rkey25: integer;treeview:Ttreeview);
    function get_date0025toprkey(rkey25: integer):integer;
  public
    { Public declarations }
  end;

var
  Frm_ProductMix: TFrm_ProductMix;

implementation

uses demo;

{$R *.dfm}

{ TFrm_ProductMix }

function TFrm_ProductMix.get_date0025toprkey(rkey25: integer): integer;
var
 rkey:integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey25);
  open;
  rkey := fieldbyname('parent_ptr').AsInteger; //等于父值
 end;

 if rkey <= 0 then
  rkey:=rkey25       //如果产品顶层等于自己
 else
  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
   open;
   if FieldByName('parent_ptr').AsInteger > 0 then
    begin
     rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
     with dm.ADOQuery3 do
      begin
       close;
       sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
       open;
       if FieldByName('parent_ptr').AsInteger > 0 then
         rkey := fieldbyname('parent_ptr').AsInteger;  //如果有太公等于太公值
      end;
    end;
  end;
 result:=rkey;

end;

procedure TFrm_ProductMix.get_treedate(rkey25: integer;
  treeview: Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  while not dm.ADOQuery1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dm.ADOQuery1.fieldbyname('rkey').AsString;
     open;
     while not dm.ADOQuery2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;

       with dm.ADOQuery3 do
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  dm.ADOQuery2.fieldbyname('rkey').AsString;
         open;
         while not dm.ADOQuery3.Eof do
         begin
          new(rkey0025);
          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
          node:=treeview.Items.AddChildObject
           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
          node.ImageIndex := 3;
          node:=node.Parent;
          dm.ADOQuery3.Next;
         end;
        end;

      node:=node.Parent;
      dm.ADOQuery2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   dm.ADOQuery1.Next;
  end;
 end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
end;

procedure TFrm_ProductMix.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  rkey25.Caption:=inttostr(Pinteger(Node.data)^);
  node.SelectedIndex:=4;
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=strtoint(rkey25.Caption);
  dm.AQY0025.Open;
end;

procedure TFrm_ProductMix.FormActivate(Sender: TObject);
begin
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
  dm.AQY0025.Open;
  self.get_treedate(dm.AQY0025RKEY.Value,treeview1);
end;



end.
