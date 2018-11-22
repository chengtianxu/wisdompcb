unit eip_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, Mask, DBCtrls;

type
  TForm_episearch = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_episearch: TForm_episearch;

implementation

uses data_module;

{$R *.dfm}

procedure TForm_episearch.BitBtn5Click(Sender: TObject);
begin
if listbox1.Items.Count>0  then
begin
 if (listbox2.Items.count = 0) then
  begin
   listbox2.Items.Add(listbox1.Items[listbox1.ItemIndex]);
   listbox1.Items.Delete(listbox1.ItemIndex);
   bitbtn5.Enabled:=false;
  end
 else
if (pos('*',listbox2.Items[listbox2.Items.count-1])>0) or
   (pos('+',listbox2.Items[listbox2.Items.count-1])>0)
    then
 begin
  listbox2.Items.Add(listbox1.Items[listbox1.ItemIndex]);
  listbox1.Items.Delete(listbox1.ItemIndex);
  bitbtn5.Enabled:=false;
 end;

end;
end;

procedure TForm_episearch.FormActivate(Sender: TObject);
begin
listbox1.Selected[0]:=true;
end;

procedure TForm_episearch.ListBox1Click(Sender: TObject);
begin
if listbox1.Items.Count>0 then  bitbtn5.Enabled:=true;
end;

procedure TForm_episearch.BitBtn4Click(Sender: TObject);
begin
if listbox2.Items.count>=1 then
if (pos('*',listbox2.Items[listbox2.Items.count-1])=0) and
   (pos('+',listbox2.Items[listbox2.Items.count-1])=0) then
listbox2.Items.Add('*');
end;

procedure TForm_episearch.BitBtn3Click(Sender: TObject);
begin
if listbox2.Items.count>=1 then
if (pos('*',listbox2.Items[listbox2.Items.count-1])=0) and
   (pos('+',listbox2.Items[listbox2.Items.count-1])=0) then
listbox2.Items.Add('+');
end;

procedure TForm_episearch.BitBtn6Click(Sender: TObject);
begin
if listbox2.Items.Count>0 then
 begin
  if (pos('*',listbox2.Items[listbox2.Items.count-1])=0) and
     (pos('+',listbox2.Items[listbox2.Items.count-1])=0) then
  listbox1.Items.Add(listbox2.Items[listbox2.Items.Count-1]);
  listbox2.Items.Delete(listbox2.Items.Count-1);
 end;
end;

procedure TForm_episearch.BitBtn1Click(Sender: TObject);
begin
if (listbox2.Items.Count<3) or (not odd(listbox2.Items.Count)) then
 showmessage('无效的计算公式，请再设!')
else
 self.ModalResult:=mrok; 
end;

end.
