unit odbc_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Database1: TDatabase;
    Table1: TTable;
    ListBox3: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
 session.GetAliasNames(listbox1.Items);
end;

procedure TForm3.ListBox1DblClick(Sender: TObject);
begin
try
 Database1.AliasName := ListBox1.Items[ListBox1.ItemIndex];
 Session.GetTableNames(Database1.AliasName, '', True, False, listbox2.items);
 if listbox2.Items.Count>0 then
  begin
   listbox2.Selected[0] := true;
   listbox2click(sender);
   button1.Enabled:=true;
  end; 
except
 messagedlg('数据源连接不成功,请检查ODBC是否配置正确!',mterror,[mbcancel],0);
 exit;
end;
end;

procedure TForm3.ListBox1Click(Sender: TObject);
begin
listbox2.Clear;
listbox3.Clear;
button1.Enabled:=false;
end;

procedure TForm3.ListBox2Click(Sender: TObject);
begin
table1.close;
listbox3.Items.Clear;
table1.Databasename:=listbox1.items[listbox1.itemindex];
table1.TableName :=listbox2.Items[listbox2.itemindex];
table1.active:=true;
table1.GetFieldNames(listbox3.Items);
end;

end.
