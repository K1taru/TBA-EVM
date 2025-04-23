'use client';

import { NFTMintCard } from '@coinbase/onchainkit/nft';
import { NFTMedia } from '@coinbase/onchainkit/nft/view';
import {
  NFTCreator, 
  NFTCollectionTitle, 
  NFTQuantitySelector, 
  NFTAssetCost, 
  NFTMintButton, 
} from '@coinbase/onchainkit/nft/mint';

export default function Page() {
  return (
    <NFTMintCard contractAddress='0x5E460559B2d57373a5D03CC096FaFFd021CE39F7'>
      <NFTCreator />
      <NFTMedia/>
      <NFTCollectionTitle />
      <NFTQuantitySelector />
      <NFTAssetCost />
      <NFTMintButton />
      <p className="scammaz">Scammaz</p>
    </NFTMintCard>
  );
}





