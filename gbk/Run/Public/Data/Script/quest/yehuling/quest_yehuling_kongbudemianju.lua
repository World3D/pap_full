--�ֲ������

--MisDescBegin
x207002_g_ScriptId = 207002
x207002_g_MissionIdPre =2
x207002_g_MissionId = 3
x207002_g_MissionKind = 1
x207002_g_ScriptIdNext = {ScriptId = 207003 ,LV = 1 }
x207002_g_Name	="�ٲ�̨" 
x207002_g_Name2	="�����" 
x207002_g_DemandItem ={{id=13010001,num=10},{id=13010005,num=1}}
x207002_g_noDemandKill ={{id=277,num=1},{id=277,num=1}}	

x207002_g_MissionName="�ֲ������"
x207002_g_MissionInfo="    �������������Ǹ�������������룿��ʵ���Ƿ��Խ�ҽ���֮��ɱ����û�а˰�Ҳ��һǧ������һ���ء��������Ҽ�������ģ���һ������һ�źֲܿ���ߵ��ˣ��Ҳ��ͱ����˵���#G�����#W�����˵�������ô����Ȥ��ԭ������������������û��Ϣ��С�ӿ���������֮�ⲻ�ھƣ�������������⣡�㵽��xxx,xxx������ȥ������Щ��²��ɱ�ˣ����������ϵĶ�������ȥ��#G�����#W���ȵȣ������߶���Ҳû�ã���һ����ȥ�����ɡ�"  --��������
x207002_g_MissionTarget="    ��#c0080C0�ֲ������#W��ʮ��#c0080C0��ɫ��ĩ#W����#G�����#W"		
x207002_g_MissionComplete="    �⣬�⣬#G�ٲ�̨#W��һ�����ǹ������Ҷ��ˣ��ٺ٣���ʱ��������Ū�㴺ҩ��ֻ�����˵˵������Ȼ���桭�����Ȳ�˵������㿴�������壬���ڿ������������ߡ���������������ۿ������Ҿ��Բ������������������顣֮������֣�����Ϊ���ڿ��������ʱ�򣬸о����ǳ�����Ϥ�������ٻ��ң�"					--�������npc˵���Ļ�
x207002_g_ContinueInfo="    #G�ٲ�̨#W������Ҵ��������ˣ�"
--������
x207002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207002_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207002_g_MissionId) > 0 then
		if x207002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207002_g_MissionName)
			AddText(sceneId,x207002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207002_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ɫ��ĩ   %d/10", LuaFnGetItemCount(sceneId,selfId,13010001) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207002_g_MissionName)
		     AddText(sceneId,x207002_g_MissionComplete)
		     AddText(sceneId,"#Y����Ŀ��#W") 
		     AddText(sceneId,x207002_g_MissionTarget) 
		     AddText(sceneId,format("\n    ��ɫ��ĩ   %d/10", LuaFnGetItemCount(sceneId,selfId,13010001) ))
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
                end

        elseif x207002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207002_g_MissionName)
                AddText(sceneId,x207002_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207002_g_ScriptId, x207002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207002_g_ScriptId, x207002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207002_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207002_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207002_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207002_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207002_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207002_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207002_OnAccept(sceneId, selfId)

	        BeginAddItem(sceneId)                                                    
			AddItem( sceneId,x207002_g_DemandItem[2].id, x207002_g_DemandItem[2].num )             
			                                             
		        ret = EndAddItem(sceneId,selfId)                                 
		        --���������                                                   
		        if ret > 0 then                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x207002_g_MissionId, x207002_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x207002_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)AddItemListToHuman(sceneId,selfId) 
		        else                                                             
		--������û�мӳɹ�                                             
			     BeginEvent(sceneId)                                      
			     	AddText(sceneId,"��Ʒ����������������������")                    
			     EndEvent(sceneId)                                        
			     DispatchMissionTips(sceneId,selfId)                      
		        end                                                              
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x207002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207002_g_MissionId)
	for i, item in pairs(x207002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207002_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,13010001) == 10 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207002_g_MissionId)
		AddExp(sceneId, selfId, x207002_g_ExpBonus)
		AddMoney(sceneId, selfId, x207002_g_MoneyBonus)
		for i, item in pairs(x207002_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x207002_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x207002_g_MissionId) >= 0 then                                       
       		 if objdataId == x207002_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,13010001) < 10 then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x207002_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ɫ��ĩ   %d/10", LuaFnGetItemCount(sceneId,selfId,13010001)+1 )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x207002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207002_OnItemChanged(sceneId, selfId, itemdataId)

end

